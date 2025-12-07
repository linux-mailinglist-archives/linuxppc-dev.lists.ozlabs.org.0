Return-Path: <linuxppc-dev+bounces-14675-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CCDCAB79D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 07 Dec 2025 17:18:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dPVdZ4zMNz2y65;
	Mon, 08 Dec 2025 03:17:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.220 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765124274;
	cv=pass; b=G6xVmfJyc5usJGbOXuENDlQiR56FzxuOuz5EAGGD76umSgkIyBKhKxcF/6gqO4fMIku6v37rvS1Qz2LL/SslgGXkJ7h8id8qAFolDv15vZoZWxeIPv7IeUq2i18TGh3iXSVovhcu7IpbaENAoA5fcbwx2Kki3leF6qFq3YT7XtKCE1UVt7T0IOhlgZfwR2AAq8BIoOhXdZPJXnCuCFnCHjOBEKRtVuWnzsoJrCvh26aai5NweDqrZMi6+vEWlXyA3Ij/zwS7dqTqAeJHiXnN9UQ+zsga3I9upvNhvjTO+WkZlAPWBGZAvYbqT4kzGLlmS3V33hibSUMYIPg84fIzkg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765124274; c=relaxed/relaxed;
	bh=h+np9xoSXFdkeuZ19zjNKyfnwaw/sp/o6VzfvsAV2gY=;
	h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type; b=aBe+zsdB1dr8fl07qUwGhDlGSsXgxtngokIT6lC7Tq4ykGilrhDYzUaovATqtTurEoyDOXGrIvdtNT7XC5xdi9Xubg/WV6HZNu6bzJqyMBMW5nWkWQIcFi+bw+zFofXo8k4bG3jNIuWt6N6ybLLcjZxGzGlVzyRGNjpFodiFN2MzEx9/0NJ1hT9ky9NOpG8T4o4+TDuOX0g5DecsBuEsmL8mXXz4O0DSlR3+2swiNF68SzsrUOWV6GFCxbj5HfOW2xz/NE08sWmjMtnKHeL2mD8vBegO0ojZ5cpsuCuKTOfHgzKzXvv9gA4Kys1VLYYi83ot9w1eqbq13l8g9rfphg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=bZfNAR+i; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=eGzQevnf; dkim-atps=neutral; spf=pass (client-ip=81.169.146.220; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p00-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=bZfNAR+i;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=eGzQevnf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.220; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dPVdV4PzJz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Dec 2025 03:17:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1765124262; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bIhd6XmuILCskbnB7IfOAM0MJ6ElUpaf8mcwy3jPZqKVtVyK5CsqYy62vzhn1dKmD0
    j3cM1fXcAAVC7yeAA0ALZeG7AYs2fEMf/ms2bYtVhhuqfYhx7gsYIQgUzrJgdAYiTC+z
    AOh7vuV9KQqdX6c6xyo1F25aF9dhaqw3GXiUGTUR1ONUrhQnPA9pzvEXpBn0NOUMErIH
    yHXrlgGN9vTc5a9ZlhQL61LomGg3K4CHQWFT+86dVRIvEbLJ8qTzPG+P0smVabjFD8Ss
    AgGwiaxITMh6sA5sOrUfL6c1+WYTJQDdgWshnPCjENybk0U4WHs16jP+G1y80MPva/WI
    8c0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1765124262;
    s=strato-dkim-0002; d=strato.com;
    h=Date:Message-ID:Subject:From:To:Cc:Date:From:Subject:Sender;
    bh=h+np9xoSXFdkeuZ19zjNKyfnwaw/sp/o6VzfvsAV2gY=;
    b=FLnWs+KwHndLljJtZlOuZLlHbbZr9VB68VeirnE3IZtykoEH8SvupWBlMuIl1+OekG
    iD32VmN5bfOUtX6saBGVDW/lNhGLbZWgxOqgAbCzUt2BCexQOpVKRxvrCeXJs1qZwneU
    ax31i7bDumUBobggz+8b4KvNo+rui9uixDPQg9zwIrI+Kr9Frml7H8MaT1cHUYSqdVZy
    PLDgerjZlccYK1XaVNIeo85bRyZGElV9mWqOhX8Y4Rx20SwvjFuQmP0PEPA/Sll9OoBX
    G1yUQJI8gCnYDE04fgktw4PO9UUnGj2cppKZ1BO75uuNZEI4AmEVuNyXbBKbqJ66gRQ8
    GLeA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1765124262;
    s=strato-dkim-0002; d=xenosoft.de;
    h=Date:Message-ID:Subject:From:To:Cc:Date:From:Subject:Sender;
    bh=h+np9xoSXFdkeuZ19zjNKyfnwaw/sp/o6VzfvsAV2gY=;
    b=bZfNAR+inykZut4BeQCZqH7VC8UCwRVSYZxfzoXRiolVODiWJ3abgK/sp3kPbU/SOk
    Jdx5OLdizV+e4g/1WUMed4Nr2Ctr0PB7kOKeeAk81Aux2ifIONZMRvTyXh0pDuRhE0cn
    /HgQZs5ibwmw6Jfv066qJUyhnpKCuiwQIIQBVark2cq7qiSDy8B+yps6KYwzW4e1pS5y
    bLuoclngzrqDnpnGkM8wUyvfQA1kuP0twGJ6yN9xcyj/dRO3x7/HoyQewNsdTXQRwi+H
    tabfBo5Doynt9nHik+ymPPzJc1IIuLHHcZ5rX39h7Ia3s3NUjKbecu44uj85CcapvJtB
    6XhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1765124262;
    s=strato-dkim-0003; d=xenosoft.de;
    h=Date:Message-ID:Subject:From:To:Cc:Date:From:Subject:Sender;
    bh=h+np9xoSXFdkeuZ19zjNKyfnwaw/sp/o6VzfvsAV2gY=;
    b=eGzQevnfsK0D9D2zNugttjbFXYMTi97UaAwV7Yh1sUIr3L0y0CVl/qCB5U7w4zSwZ5
    yGWg428R6cxJzKoSMUDw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIS+m7B/g"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 54.0.0 DYNA|AUTH)
    with ESMTPSA id ed69d81B7GHf9UN
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 7 Dec 2025 17:17:41 +0100 (CET)
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <info@xenosoft.de>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [PPC] [e5500] Boot issues after the PowerPC updates 6.19-1
Organization: A-EON Open Source
Message-ID: <4d0bd05d-6158-1323-3509-744d3fbe8fc7@xenosoft.de>
Date: Sun, 7 Dec 2025 17:17:41 +0100
X-Mailer: BrassMonkey/33.9.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

The latest Git kernel doesn't boot anymore on our e5500 machines (QEMU, 
X5000, Mirari etc) after the PowerPC updates 6.19-1. [1]

Error messages (QEMU e5500 VM):

Bad kernel stack pointer 4d694c01a88270 at c0000000000003bc
Oops: Bad kernel stack pointer, sig: 6 [#1]
BE PAGE_SIZE=4K  SMP NR_CPUS=4 QEMU e500
Modules linked in:
CPU: 2 UID: 0 PID: 2788 Comm: udevd Not tainted 
6.19.0-a4-powerpc64-smp-g416f99c3b16f-dirty #1 VOLUNTARY
Hardware name: QEMU ppce500 e5500 0x80240012 QEMU e500
NIP:  c0000000000003bc LR: 0000000000230760 CTR: 0000000000230754
REGS: c00000003ff9bd20 TRAP: 0300   Not tainted 
(6.19.0-a4-powerpc64-smp-g416f99c3b16f-dirty)
MSR:  0000000090029000 <CE,EE,ME>  CR: 48842888  XER: 20000000
DEAR: 004d694c01a882f0 ESR: 0000000000000000 IRQMASK: 1
GPR00: 01a56ad000000000 004d694c01a88270 ffd86ca00046c958 ffd86c89ffffffff
GPR04: 0000000000000000 00000000ffffffff 0000000000000000 0000000000000007
GPR08: 000000000037a60c 0000000000000000 0000000000000000 0000000000230754
GPR12: 0000000004000000 c00000003fff7900 0000000000000004 0000000001a88270
GPR16: 00000000020397f0 0000000000bc287c 00000000004d009c 0000000000000000
GPR20: 0000000000000000 0000000000000000 00000000ffd86d5c 0000000001a4a130
GPR24: 00000000004d0040 00000000ffd86bdc 0000000000000000 00000000ffd86ab4
GPR28: 00000000004d009c 0000000001a807e0 0000000000379fc0 0000000001a84b50
NIP [c0000000000003bc] interrupt_return_srr_user+0x80/0xf4
LR [0000000000230760] 0x230760
Call Trace:
Code: 38000000 e8e100a8 e90100b0 e92100b8 e94100c0 e96100c8 e98100d0 
e9a100d8 7c6ff120 7c8803a6 7ca903a6 7cc103a6 <e8410080> e8610088 
e8810090 e8a10098
---[ end trace 0000000000000000 ]---

note: udevd[2788] exited with irqs disabled

---

Please check the PowerPC updates 6.19-1. [1]

You can check it yourself with QEMU. ;-)

Thanks,
Christian


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ad952db4a865e96ec98d4c5874a4699fe3286d56

-- 
Sent with BrassMonkey 33.9.1 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.9.1)


