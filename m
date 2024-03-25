Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3417888E8B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 06:22:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=YTPN9++q;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=paA1++ZZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V31XG3bsKz3dWj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 16:22:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=YTPN9++q;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=paA1++ZZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.167; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 138 seconds by postgrey-1.37 at boromir; Mon, 25 Mar 2024 16:21:43 AEDT
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V31WW44bRz2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 16:21:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711343916; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=b7th4FG2rrVwY+CtVHYiMUkCWlI9i8MkZi0/0Qf9GdA5SDzyXfP3UpBneso8y2br/Y
    0a5AIeklNgBiDJjNEKoVhz9/dOAdaMCEa5PkOJIHGhOEygcaagGhhZp/SAvvvfsowLJ3
    5K70A+8yUQ/qnJl1vXL7nhrfkWVbBIjkRqRElY+KlEmdnwwT7qJEvNL+gzpr5cjPOzVg
    LSg346/SFAlc3NpLiCc+FzZXrupLn0pLpeK+miFAWUb/NQkAHNfheBuG5Qh6Cpb8MrDB
    HrmiTzt743/2Gak0OAfnGZ/uP3Uyx/XHLWeWkldNOOpvmSixlZ4MosC8GZ8jwjLfFWxz
    JSIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1711343916;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=c8f4Ocl60Gvr6M9GiLWC34lQhec8Hxr6qFIesOSWTX0=;
    b=mDkSLD1TJwNV9hJj1m90n+nPoKDp+gHPSGvNbyxtfJl+m3VskD2NScpqL9owSJvck3
    ySdOe6vL+za5F5foqp14IKMhSpPz8fSxw0CQqKIkoRMtqGYsTSp1xgxLQQymw8qMrslo
    +/IHK5qsdQz34LCBbfWeQY/zNzQ3YnHSSyklLGNhYcyYPIh9kqSpBJL5ByAO9u/QM2bE
    f5RfPMxp1QbG8eILjg0vgjC2wk9SPnF8zjI0+AnoterFy6khrfNoevnekHp7YlMuJX5i
    tUU5vGUtVWxtRk2R1bNnxuuAvEVFGW1H+huRP1ZzQpi0Or+1P0G6TudJVow5uUIgIWoz
    f0Iw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1711343916;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=c8f4Ocl60Gvr6M9GiLWC34lQhec8Hxr6qFIesOSWTX0=;
    b=YTPN9++qinZzFwYOamJymDM7cctSw4BmiD1E9gdRiPUVE0xMQg3b/Mhri1Yy47l9fy
    f6ZudwVO+aN1lAMrA0ATRdZ9MXEG2EobHAIqCKKzzj/tP/e8TDpOPkFh/HGKzuVvfYpP
    KnP9pjBdQ2UVWvJVfb2nSj/o60IlU7AV+0ZB3Nye1Kjh33vxy0T7yOrLF/gD1F1uPF3/
    3qo8mSu8XfgJHdx1f9ClPffklh3NUjocUkSeI0y8X8+JeyQ/ndkVuMNjUwXKuhK4hv99
    6aJVojT4QYRgF5OMQMiWCQqrXt0uo1M4DQacBgRTroaAwum3U4uwtGhigDtRc9Fnkk4T
    MpGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1711343916;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=c8f4Ocl60Gvr6M9GiLWC34lQhec8Hxr6qFIesOSWTX0=;
    b=paA1++ZZLUjOEuRoAD9kWcHUhz4LY5NdLY49yWpUdNy2juefIetZsjLZX3ZG/D3KYw
    6r7LhC122LJSU1RuD0DA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfi4XXBswJY1xkHd0jCgCs4udHdhJKmTWY2xslQ=="
Received: from [IPV6:2a02:8109:8984:5d00:299c:b5cd:1d87:5681]
    by smtp.strato.de (RZmta 50.3.2 AUTH)
    with ESMTPSA id eaf61b02P5Ia4Lv
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 25 Mar 2024 06:18:36 +0100 (CET)
Message-ID: <761e7864-4655-4b58-b0ad-60d716c5f321@xenosoft.de>
Date: Mon, 25 Mar 2024 06:18:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [FSL P50x0] Kernel 6.9-rc1 compiling issue
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, hbathini@linux.ibm.com
References: <fa247ae4-5825-4dbe-a737-d93b7ab4d4b9@xenosoft.de>
Content-Language: de-DE
In-Reply-To: <fa247ae4-5825-4dbe-a737-d93b7ab4d4b9@xenosoft.de>
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

I have created a patch:

--- a/arch/powerpc/platforms/85xx/smp.c 2024-03-25 06:14:02.201209476 +0100
+++ b/arch/powerpc/platforms/85xx/smp.c 2024-03-25 06:10:04.421425931 +0100
@@ -393,6 +393,7 @@ static void mpc85xx_smp_kexec_cpu_down(i
         int disable_threadbit = 0;
         long start = mftb();
         long now;
+       int crashing_cpu = -1;

         local_irq_disable();
         hard_irq_disable();

---

-- Christian


On 25 March 2024 at 05:48 am, Christian Zigotzky wrote:
> Hi All,
>
> Compiling of the RC1 of kernel 6.9 doesn’t work anymore for our FSL 
> P5020/P5040 boards [1] since the PowerPC updates 6.9-2 [2].
>
> Error messages:
>
> arch/powerpc/platforms/85xx/smp.c: In function 
> 'mpc85xx_smp_kexec_cpu_down':
> arch/powerpc/platforms/85xx/smp.c:401:13: error: 'crashing_cpu' 
> undeclared (first use in this function); did you mean 'crash_save_cpu'?
>   401 |  if (cpu == crashing_cpu && cpu_thread_in_core(cpu) != 0) {
>       |             ^~~~~~~~~~~~
>       |             crash_save_cpu
> arch/powerpc/platforms/85xx/smp.c:401:13: note: each undeclared 
> identifier is reported only once for each function it appears in
> make[5]: *** [scripts/Makefile.build:244: 
> arch/powerpc/platforms/85xx/smp.o] Error 1
> make[4]: *** [scripts/Makefile.build:485: arch/powerpc/platforms/85xx] 
> Error 2
> make[3]: *** [scripts/Makefile.build:485: arch/powerpc/platforms] Error 2
> make[2]: *** [scripts/Makefile.build:485: arch/powerpc] Error 2
>
> ---
>
> I was able to revert it. After that the compiling works again.
>
> Could you please check the PowerPC updates 6.9-2? [2]
>
> Thanks,
> Christian
>
> [1] http://wiki.amiga.org/index.php?title=X5000
> [2] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.9-rc1&id=484193fecd2b6349a6fd1554d306aec646ae1a6a

