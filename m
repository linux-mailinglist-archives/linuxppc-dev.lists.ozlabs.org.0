Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F9D888D8F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 05:52:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=F/O/1o3X;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=uHxHoUbb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V30sb1S7Vz3dWb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 15:52:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=F/O/1o3X;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=uHxHoUbb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 133 seconds by postgrey-1.37 at boromir; Mon, 25 Mar 2024 15:51:37 AEDT
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V30rn6Fkbz2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 15:51:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711342110; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=KM1gqukNZs/d1Eg1N0y+qcCPWoLlrQP4KdBoSmqC31Nu3LnNUHxu7mOUvazP2wkNHn
    kQeXFovf05EzaNabX148AB4ivRg8ZD3uTHcTeRsfWypHul7+MpowRwVFVvgBxD9IXBx9
    NIm9zRPOEPpb2RCpHDRGLh3xqis/uux6ASdhO7uDWiBMxvRk7r/7OnElcWM1Z/4NLfmB
    nBjwnhdlQEWXklFh3r+8PTaycDje8XW0nOSFNo2mFMLHO4yL+KZQGoMrAn90rCWrWGuK
    WyHMzBvHYt6OLkKyivfI2NJJ8BMoQ7wT5b1uG79xRf8GzWrvbT/qhWQbvx1dua+i7n++
    /m1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1711342110;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=9tlt6VnKn+i55GYf6OfIa+/FwEz6BFQDHJPH8qbYv30=;
    b=a+sqmNburkiDUZsvb3hSrp6XbqCd8BerzWaPfE6y/tqh9KlVT4YTYWh3vSLsncai62
    sK7VkdOsxj1AlePfVBtqr38ZMx8gJhOuDkQuy6r9JGPYrG0ojiOFhEeP0xkTwC/3M2vd
    Y0NVC6Yxux5gmSeJUchbGeVXd9h+6OtaKladdZREPQGEDkrATelFDgR/rJ0+3Bw40LOE
    Olpdz7RJFqALgN4OjT1qmSv7zG9A2Y8ueJwBMtuG8xTVhmOASr+jF8kMfER2AxNtEsNG
    PPZ2g6YA8+Oza58q5AUa81ay3OdfhidF6DC7dg4pfzOL5BedeTQCna9Z1T7CyVQB6c/H
    nFeQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1711342110;
    s=strato-dkim-0002; d=xenosoft.de;
    h=Cc:Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=9tlt6VnKn+i55GYf6OfIa+/FwEz6BFQDHJPH8qbYv30=;
    b=F/O/1o3XRAOzrvGMXbCeZt9cRoMe2Q5/mNmZNnhaF/0PFtQ1h/zhSai8XiDZyv09Rl
    SrDJ0pgwKEVtlfpeBmy8A933Q1M8E7SRx8mW7Vq07ji9kocI3TgDtgcLVXHKsG+VXK/g
    k0d+zWj/wZ6OUfQ5WBdAcpMyvyhv37kK4/MplbWU64Cc/wIHePhtuFAMBlcSu1ULHO/U
    qcdRNWagNnWeBa9A8QxCO4NDivZ5oWFGEX5orMsdDE2TmUwjhvyIuiKih/y1OFuJv2yj
    0y/nDQh0eP1uUGLRabqSaCEo3RsmFnwFbHIGPqSpMv1Lqzp2khmaB4Z/4ULbV8eMC9xy
    cu7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1711342110;
    s=strato-dkim-0003; d=xenosoft.de;
    h=Cc:Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=9tlt6VnKn+i55GYf6OfIa+/FwEz6BFQDHJPH8qbYv30=;
    b=uHxHoUbbAJR1fgQIPnP2ffDCSUIy1sOwOreefTn8Q/jpOcOJsWmMFNahksdolAiDPU
    XzJ3z2xymoFWAt0kgVDg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfi4XXBswJY1xkHd0jCgCs4udHdhJKmTWY2xslQ=="
Received: from [IPV6:2a02:8109:8984:5d00:299c:b5cd:1d87:5681]
    by smtp.strato.de (RZmta 50.3.2 AUTH)
    with ESMTPSA id eaf61b02P4mS4Kn
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 25 Mar 2024 05:48:28 +0100 (CET)
Message-ID: <fa247ae4-5825-4dbe-a737-d93b7ab4d4b9@xenosoft.de>
Date: Mon, 25 Mar 2024 05:48:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, hbathini@linux.ibm.com
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [FSL P50x0] Kernel 6.9-rc1 compiling issue
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd@a-eon.com>, Matthew Leaman <matthew@a-eon.biz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

The Compiling of the RC1 of kernel 6.9 doesn’t work anymore for our FSL 
P5020/P5040 boards [1] since the PowerPC updates 6.9-2 [2].

Error messages:

arch/powerpc/platforms/85xx/smp.c: In function 'mpc85xx_smp_kexec_cpu_down':
arch/powerpc/platforms/85xx/smp.c:401:13: error: 'crashing_cpu' 
undeclared (first use in this function); did you mean 'crash_save_cpu'?
   401 |  if (cpu == crashing_cpu && cpu_thread_in_core(cpu) != 0) {
       |             ^~~~~~~~~~~~
       |             crash_save_cpu
arch/powerpc/platforms/85xx/smp.c:401:13: note: each undeclared 
identifier is reported only once for each function it appears in
make[5]: *** [scripts/Makefile.build:244: 
arch/powerpc/platforms/85xx/smp.o] Error 1
make[4]: *** [scripts/Makefile.build:485: arch/powerpc/platforms/85xx] 
Error 2
make[3]: *** [scripts/Makefile.build:485: arch/powerpc/platforms] Error 2
make[2]: *** [scripts/Makefile.build:485: arch/powerpc] Error 2

---

I was able to revert it. After that the compiling works again.

Could you please check the PowerPC updates 6.9-2? [2]

Thanks,
Christian

[1] http://wiki.amiga.org/index.php?title=X5000
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.9-rc1&id=484193fecd2b6349a6fd1554d306aec646ae1a6a
