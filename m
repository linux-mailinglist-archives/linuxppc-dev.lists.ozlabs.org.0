Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAED51633B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 22:02:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MYG37385zDqfK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 08:02:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=jmoyer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=KO14cYls; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MYCT3R1zzDqbg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 08:00:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582059617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R+5nH0RbYnRX8oS+gNkYUcbLgvJOnmEAnQ8QVqp5CYo=;
 b=KO14cYlscttop84o0A898wfIp2xfQsg58xuVzQJlWhtzt3he+1js+sC9TzI9g0JyfrH8d5
 Aznm4R+ki71v76tnstugN3Lh6I4EovDKA6tm1tkZ5/NLbfjqog0s92uxAilpEuFTwW/oY3
 VcbN3ac0fdKnpvqTxNBMjC7z4vDoWsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-tFGKheXRND-26PKBmDudDQ-1; Tue, 18 Feb 2020 16:00:13 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7E2B18C8C39;
 Tue, 18 Feb 2020 21:00:11 +0000 (UTC)
Received: from segfault.boston.devel.redhat.com
 (segfault.boston.devel.redhat.com [10.19.60.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA9D438D;
 Tue, 18 Feb 2020 21:00:10 +0000 (UTC)
From: Jeff Moyer <jmoyer@redhat.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH] libnvdimm/bus: return the outvar 'cmd_rc' error code in
 __nd_ioctl()
References: <20200122155304.120733-1-vaibhav@linux.ibm.com>
X-PGP-KeyID: 1F78E1B4
X-PGP-CertKey: F6FE 280D 8293 F72C 65FD  5A58 1FF8 A7CA 1F78 E1B4
Date: Tue, 18 Feb 2020 16:00:09 -0500
In-Reply-To: <20200122155304.120733-1-vaibhav@linux.ibm.com> (Vaibhav Jain's
 message of "Wed, 22 Jan 2020 21:23:04 +0530")
Message-ID: <x49r1yrboh2.fsf@segfault.boston.devel.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: tFGKheXRND-26PKBmDudDQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> Presently the error code returned via out variable 'cmd_rc' from the
> nvdimm-bus controller function is ignored when called from
> __nd_ioctl() and never communicated back to user-space code that called
> an ioctl on dimm/bus.
>
> This minor patch updates __nd_ioctl() to propagate the value of out
> variable 'cmd_rc' back to user-space in case it reports an error.
>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>  drivers/nvdimm/bus.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/nvdimm/bus.c b/drivers/nvdimm/bus.c
> index a8b515968569..5b687a27fdf2 100644
> --- a/drivers/nvdimm/bus.c
> +++ b/drivers/nvdimm/bus.c
> @@ -1153,6 +1153,11 @@ static int __nd_ioctl(struct nvdimm_bus *nvdimm_bu=
s, struct nvdimm *nvdimm,
>  =09if (rc < 0)
>  =09=09goto out_unlock;
> =20
> +=09if (cmd_rc < 0) {
> +=09=09rc =3D cmd_rc;
> +=09=09goto out_unlock;
> +=09}
> +
>  =09if (!nvdimm && cmd =3D=3D ND_CMD_CLEAR_ERROR && cmd_rc >=3D 0) {
>  =09=09struct nd_cmd_clear_error *clear_err =3D buf;

Looks good to me.

Reviewed-by: Jeff Moyer <jmoyer@redhat.com>

