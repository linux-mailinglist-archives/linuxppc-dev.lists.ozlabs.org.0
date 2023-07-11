Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0068D74EF19
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 14:37:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OAhTb2hg;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Oc/6Nn1y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0gPh6ZvJz3btJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 22:37:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OAhTb2hg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Oc/6Nn1y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fweimer@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0fqG2Vt7z2y1b
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 22:11:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689077476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jciyvh7bPAJKrnb358k+MOZYCgue2kVbXpRfHdO7VwM=;
	b=OAhTb2hgauSJM/zUglDOdIX+JvWiKeqhZKgzsOMdK1OaamJa6tetk677HGlcaFyEopPRwJ
	pst0UrEUTdww+NmpxF6RE+X/pPI73aAkQz6pfw5vc+UgYI4ufA5C+K8ugXOyCUxDTYirMz
	pNhDZatVJ6kUcc5b+wIDWk8suY/9dlQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689077477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jciyvh7bPAJKrnb358k+MOZYCgue2kVbXpRfHdO7VwM=;
	b=Oc/6Nn1y9AeOJ4QZG+kRddbD/PvZJtdfnlQ/T68QG3oHcZJIRQnTmaPzTv6YHIbZwcTndf
	PLj08jbv9C80rEXnekvukv+mKKotL9o49PYQGLx9NkWVgzEpCNllqQOp9ZC/zT0s+xY2Kx
	BYSy2y1VkQZSBOhM8GU6yTz2bY+iW3k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-XU6uHA3jMOyx2Kr6qDivBg-1; Tue, 11 Jul 2023 08:11:13 -0400
X-MC-Unique: XU6uHA3jMOyx2Kr6qDivBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E2A9185A791;
	Tue, 11 Jul 2023 12:11:11 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.2.16.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA8111401C2E;
	Tue, 11 Jul 2023 12:10:59 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Alexey Gladkov <legion@kernel.org>
Subject: Re: [PATCH v3 5/5] selftests: add fchmodat4(2) selftest
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
	<cover.1689074739.git.legion@kernel.org>
	<c3606ec38227d921fa8a3e11613ffdb2f3ea7636.1689074739.git.legion@kernel.org>
Date: Tue, 11 Jul 2023 14:10:58 +0200
In-Reply-To: <c3606ec38227d921fa8a3e11613ffdb2f3ea7636.1689074739.git.legion@kernel.org>
	(Alexey Gladkov's message of "Tue, 11 Jul 2023 13:25:46 +0200")
Message-ID: <87pm4ybqct.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Tue, 11 Jul 2023 22:37:01 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, palmer@sifive.com, heiko.carstens@de.ibm.com, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, gor@linux.ibm.com, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org, jhogan@kernel.org, firoz.khan@linaro.org, mattst88@gmail.com, linux-mips@vger.kernel.org, fenghua.yu@intel.com, Arnd Bergmann <arnd@arndb.de>, peterz@infradead.org, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, schwidefsky@de.ibm.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linu
 tronix.de, christian@brauner.io, rth@twiddle.net, axboe@kernel.dk, James.Bottomley@HansenPartnership.com, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, paul.burton@mips.com, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, ink@jurassic.park.msu.ru, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Alexey Gladkov:

> The test marks as skipped if a syscall with the AT_SYMLINK_NOFOLLOW flag
> fails. This is because not all filesystems support changing the mode
> bits of symlinks properly. These filesystems return an error but change
> the mode bits:
>
> newfstatat(4, "regfile", {st_mode=3DS_IFREG|0640, st_size=3D0, ...}, AT_S=
YMLINK_NOFOLLOW) =3D 0
> newfstatat(4, "symlink", {st_mode=3DS_IFLNK|0777, st_size=3D7, ...}, AT_S=
YMLINK_NOFOLLOW) =3D 0
> syscall_0x1c3(0x4, 0x55fa1f244396, 0x180, 0x100, 0x55fa1f24438e, 0x34) =
=3D -1 EOPNOTSUPP (Operation not supported)
> newfstatat(4, "regfile", {st_mode=3DS_IFREG|0640, st_size=3D0, ...}, AT_S=
YMLINK_NOFOLLOW) =3D 0
>
> This happens with btrfs and xfs:
>
>  $ /kernel/tools/testing/selftests/fchmodat4/fchmodat4_test
>  TAP version 13
>  1..1
>  ok 1 # SKIP fchmodat4(symlink)
>  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0
>
>  $ stat /tmp/ksft-fchmodat4.*/symlink
>    File: /tmp/ksft-fchmodat4.3NCqlE/symlink -> regfile
>    Size: 7               Blocks: 0          IO Block: 4096   symbolic link
>  Device: 7,0     Inode: 133         Links: 1
>  Access: (0600/lrw-------)  Uid: (    0/    root)   Gid: (    0/    root)
>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>

This looks like a bug in those file systems?

As an extra test, =E2=80=9Cecho 3 > /proc/sys/vm/drop_caches=E2=80=9D somet=
imes has
strange effects in such cases because the bits are not actually stored
on disk, only in the dentry cache.

Thanks,
Florian

