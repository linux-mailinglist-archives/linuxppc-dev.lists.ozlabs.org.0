Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F14E133778
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 00:36:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47spg32kkbzDqdj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 10:36:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=wb8/=24=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47snvz3RrFzDqTY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 10:02:39 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 206049] alg: skcipher: p8_aes_xts encryption unexpectedly
 succeeded on test vector "random: len=0 klen=64"; expected_error=-22,
 cfg="random: inplace may_sleep use_finup src_divs=[<flush>66.99%@+10,
 33.1%@alignmask+1155]
Date: Tue, 07 Jan 2020 23:02:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206049-206035-wUmN6Rkm8u@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206049-206035@https.bugzilla.kernel.org/>
References: <bug-206049-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D206049

--- Comment #5 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Michael Ellerman from comment #3)
> Looks like other implementations check the size, can you try this:
>=20
> diff --git a/drivers/crypto/vmx/aes_xts.c b/drivers/crypto/vmx/aes_xts.c
> index d59e736882f6..9fee1b1532a4 100644
> --- a/drivers/crypto/vmx/aes_xts.c
> +++ b/drivers/crypto/vmx/aes_xts.c
> @@ -84,6 +84,9 @@ static int p8_aes_xts_crypt(struct skcipher_request *re=
q,
> int enc)
>       u8 tweak[AES_BLOCK_SIZE];
>       int ret;
>=20=20
> +     if (req->cryptlen < AES_BLOCK_SIZE)
> +             return -EINVAL;
> +
>       if (!crypto_simd_usable() || (req->cryptlen % XTS_BLOCK_SIZE) !=3D =
0) {
>               struct skcipher_request *subreq =3D skcipher_request_ctx(re=
q);
Your patch fixed it, thanks! Applied it on top of kernel 5.4.8 and the
p8_aes_xts error did not show up in subsequent reboots.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
