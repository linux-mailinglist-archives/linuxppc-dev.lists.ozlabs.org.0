Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5983730C9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 21:27:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZVHC6hTxz30GN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 05:27:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VIToxAvO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b;
 helo=mail-wr1-x42b.google.com; envelope-from=lijunp213@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VIToxAvO; dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZVGn3VGHz2yZM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 05:27:26 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id l13so9002754wru.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 12:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wb+vWEOFiIFM3Mz5o76OTH4EfZOujmuyz+elQMeqLQo=;
 b=VIToxAvOdFoaGs0bWVtPJA8LG0YIc1UGof+WH8l5f1enDaLVZjuAd746q45aa+cDKb
 CB/cCCkGA/ORk8DoTp6DH0MhtoxArvzmPLY2oy5NLSgX5K52XEIM2OBzW+IWnIqFbkdD
 CgsRAl0a+67YPGGw6JcF1ufeWKCdfjC+RoRziCWKEFpFeiIEk+5tk5lP4cWJdwSYOORF
 spPrAiXFey9re+QSgPk5GEC3ahmEEuLKHPV+f7sEu79+odWYFu43BdyEI4IjPMmyhpMT
 zrkNwwpYpuO+SiAEYJTkcl9Vw/IuboUFUTawFd1AjFIAZftQmAxK/C8c2uQPyUa51vaG
 qk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wb+vWEOFiIFM3Mz5o76OTH4EfZOujmuyz+elQMeqLQo=;
 b=HZIsFB5EHBBO/G7AerNk3juku/4NtL9bfbrWZrt6jbzEMntknMYHE/ngE/rLnj1GVb
 4ZSP34YwPu+cxSGytaeBkRSFhSx9EN0/eCWsT0p9XVwMx9xtxtPy+MMreFG0QmqLb0ng
 u4LvHXoxinOTXVjWEdCCSpbdxOxnpUEw/sUXVU+NaQ2LamRuUACcD//Yg48zee/S10aN
 GpGN5kNlkyVfjx2I+sn8Nv1piiiAiTbAe0+/JWWdsWcPapSCaTJmDgAcEvqyjRpHd9jh
 7bLzSHo4e8jC2LbCq/T7rYD7tDP/iM4ila8s1FOnz0aJVc4t+9iqXk1qq/wJ53+o1a/W
 8klA==
X-Gm-Message-State: AOAM5320b64byZWC8xBpGTliWxlAADDKKDZv0wL3xogJWQ3spIWWQD91
 hV8G//P12bryAgK5gATixK3FfEYDt8NyxvTp41g=
X-Google-Smtp-Source: ABdhPJz85Gj0al2t2XWZAUvciA1TddiCwl1LvqFr6ZKk4S5cteIVmH9r0CKOPCSb+UXqfyNSY1hSYwbDjCt6qIGGuRY=
X-Received: by 2002:a5d:64e4:: with SMTP id g4mr33792944wri.366.1620156439866; 
 Tue, 04 May 2021 12:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210504191142.2872696-1-drt@linux.ibm.com>
In-Reply-To: <20210504191142.2872696-1-drt@linux.ibm.com>
From: Lijun Pan <lijunp213@gmail.com>
Date: Tue, 4 May 2021 14:27:09 -0500
Message-ID: <CAOhMmr5T_BLkqGspnzck=xtiX0rPABv8oX4=LCRbH00T8-B6qw@mail.gmail.com>
Subject: Re: [PATCH net v3] ibmvnic: Continue with reset if set link down
 failed
To: Dany Madden <drt@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Falcon <tlfalcon@linux.ibm.com>, netdev@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Jakub Kicinski <kuba@kernel.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 4, 2021 at 2:14 PM Dany Madden <drt@linux.ibm.com> wrote:
>
> When ibmvnic gets a FATAL error message from the vnicserver, it marks
> the Command Respond Queue (CRQ) inactive and resets the adapter. If this
> FATAL reset fails and a transmission timeout reset follows, the CRQ is
> still inactive, ibmvnic's attempt to set link down will also fail. If
> ibmvnic abandons the reset because of this failed set link down and this
> is the last reset in the workqueue, then this adapter will be left in an
> inoperable state.
>
> Instead, make the driver ignore this link down failure and continue to
> free and re-register CRQ so that the adapter has an opportunity to
> recover.
>
> Fixes: ed651a10875f ("ibmvnic: Updated reset handling")
> Signed-off-by: Dany Madden <drt@linux.ibm.com>
> Reviewed-by: Rick Lindsley <ricklind@linux.ibm.com>
> Reviewed-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> ---
> Changes in V2:
> - Update description to clarify background for the patch
> - Include Reviewed-by tags
> Changes in V3:
> - Add comment above the code change
> ---
>  drivers/net/ethernet/ibm/ibmvnic.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> index 5788bb956d73..9e005a08d43b 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.c
> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> @@ -2017,8 +2017,15 @@ static int do_reset(struct ibmvnic_adapter *adapter,
>                         rtnl_unlock();
>                         rc = set_link_state(adapter, IBMVNIC_LOGICAL_LNK_DN);
>                         rtnl_lock();
> -                       if (rc)
> -                               goto out;
> +
> +                       /* Attempted to set the link down. It could fail if the
> +                        * vnicserver has already torn down the CRQ. We will
> +                        * note it and continue with reset to reinit the CRQ.
> +                        */
> +                       if (rc) {
> +                               netdev_dbg(netdev,
> +                                          "Setting link down failed rc=%d. Continue anyway\n", rc);
> +                       }

There are other places which check and rely on the return value of
this function. Your change makes that inconsistent. Can you stop
posting new versions and soliciting the maintainer to accept it before
there is material change? There are many ways to make reset
successful. I think this is the worst approach of all.


>
>                         if (adapter->state == VNIC_OPEN) {
>                                 /* When we dropped rtnl, ibmvnic_open() got
> --
> 2.18.2
>
