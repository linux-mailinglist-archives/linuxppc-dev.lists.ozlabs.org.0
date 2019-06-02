Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA32322EA
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2019 12:16:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45GvHJ5ygzzDqV5
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2019 20:16:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45GvG510cXzDqQg
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jun 2019 20:15:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45GvG369hPz9s7h;
 Sun,  2 Jun 2019 20:15:39 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <natechancellor@gmail.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH] scsi: ibmvscsi: Don't use rc uninitialized in
 ibmvscsi_do_work
In-Reply-To: <20190531185306.41290-1-natechancellor@gmail.com>
References: <20190531185306.41290-1-natechancellor@gmail.com>
Date: Sun, 02 Jun 2019 20:15:38 +1000
Message-ID: <87blzgnvhx.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nathan,

Nathan Chancellor <natechancellor@gmail.com> writes:
> clang warns:
>
> drivers/scsi/ibmvscsi/ibmvscsi.c:2126:7: warning: variable 'rc' is used
> uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
>         case IBMVSCSI_HOST_ACTION_NONE:
>              ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/scsi/ibmvscsi/ibmvscsi.c:2151:6: note: uninitialized use occurs
> here
>         if (rc) {
>             ^~
>
> Initialize rc to zero so that the atomic_set and dev_err statement don't
> trigger for the cases that just break.
>
> Fixes: 035a3c4046b5 ("scsi: ibmvscsi: redo driver work thread to use enum action states")
> Link: https://github.com/ClangBuiltLinux/linux/issues/502
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/scsi/ibmvscsi/ibmvscsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
> index 727c31dc11a0..6714d8043e62 100644
> --- a/drivers/scsi/ibmvscsi/ibmvscsi.c
> +++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
> @@ -2118,7 +2118,7 @@ static unsigned long ibmvscsi_get_desired_dma(struct vio_dev *vdev)
>  static void ibmvscsi_do_work(struct ibmvscsi_host_data *hostdata)
>  {
>  	unsigned long flags;
> -	int rc;
> +	int rc = 0;
>  	char *action = "reset";
>  
>  	spin_lock_irqsave(hostdata->host->host_lock, flags);

It's always preferable IMHO to keep any initialisation as localised as
possible, so that the compiler can continue to warn about uninitialised
usages elsewhere. In this case that would mean doing the rc = 0 in the
switch, something like:

diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index 727c31dc11a0..7ee5755cf636 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -2123,9 +2123,6 @@ static void ibmvscsi_do_work(struct ibmvscsi_host_data *hostdata)
 
        spin_lock_irqsave(hostdata->host->host_lock, flags);
        switch (hostdata->action) {
-       case IBMVSCSI_HOST_ACTION_NONE:
-       case IBMVSCSI_HOST_ACTION_UNBLOCK:
-               break;
        case IBMVSCSI_HOST_ACTION_RESET:
                spin_unlock_irqrestore(hostdata->host->host_lock, flags);
                rc = ibmvscsi_reset_crq_queue(&hostdata->queue, hostdata);
@@ -2142,7 +2139,10 @@ static void ibmvscsi_do_work(struct ibmvscsi_host_data *hostdata)
                if (!rc)
                        rc = ibmvscsi_send_crq(hostdata, 0xC001000000000000LL, 0);
                break;
+       case IBMVSCSI_HOST_ACTION_NONE:
+       case IBMVSCSI_HOST_ACTION_UNBLOCK:
        default:
+               rc = 0;
                break;
        }


But then that makes me wonder if that's actually correct?

If we get an action that we don't recognise should we just throw it away
like that? (by doing hostdata->action = IBMVSCSI_HOST_ACTION_NONE). Tyrel?

cheers
