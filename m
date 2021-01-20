Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2CF2FDB35
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 21:53:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLd681dhGzDqhH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 07:53:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NoeHWcji; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLYk04fwzzDqLZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 05:20:55 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10KI3Htm010653
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 13:20:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : mime-version :
 content-type : from : in-reply-to : date : cc : content-transfer-encoding
 : message-id : references : to; s=pp1;
 bh=cIIB8y1P/hZd5eRbbjMR9K3EawScybNRNspfy+u9B0M=;
 b=NoeHWcjikeln1PdbftwPiOAoGQWyIefbSlHyt030+G0QiIQ7qZ+7Ixk9ieZU7Pz3Fbqw
 Y5slaTWMXWXH+Gs4do3tGEtiBC+nivKKfvoXSXm8aX9YDc+gi4iQDDNUJQkw5JLfYeQ/
 qPij1oncwX8I/LbBLZZlebBwoS99COcdxYsPco4py/fHoEyAFT7snMJ1bg9KdxycbB34
 D2MzQ183HKChzsSZFpcdaN40uXMxgx13sJohzBs8k16aFSnBUBHuAK5kl/0Wgs/Ddww7
 nVEOleJfxOfCSxs7fTVO6eYUAkdE5EO5C+z/O0nTDJIe1HG0Wh2PZxELb7VXX1CS59Uz Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 366s7trqnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 13:20:49 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10KI3Ulc012271
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 13:20:49 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 366s7trqn5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 13:20:49 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10KIGf7p000872;
 Wed, 20 Jan 2021 18:20:47 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3668nwrwpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 18:20:47 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10KIKjGl41419254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 18:20:45 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4EE1142042;
 Wed, 20 Jan 2021 18:20:45 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F54642045;
 Wed, 20 Jan 2021 18:20:44 +0000 (GMT)
Received: from [9.79.237.231] (unknown [9.79.237.231])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 20 Jan 2021 18:20:43 +0000 (GMT)
Subject: Re: [PATCH] powerpc/64: prevent replayed interrupt handlers from
 running softirqs
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Content-Type: text/html;
	charset=utf-8
X-Apple-Auto-Saved: 1
X-Apple-Mail-Plain-Text-Draft: yes
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
X-Apple-Mail-Remote-Attachments: YES
X-Apple-Base-Url: x-msg://6/
In-Reply-To: <20210120075005.1678565-1-npiggin@gmail.com>
X-Apple-Windows-Friendly: 1
Date: Wed, 20 Jan 2021 23:42:21 +0530
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
Message-Id: <EE72B9A5-2DEE-4C5F-AA47-D8CC8415B397@linux.vnet.ibm.com>
References: <20210120075005.1678565-1-npiggin@gmail.com>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_10:2021-01-20,
 2021-01-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101200102
X-Mailman-Approved-At: Thu, 21 Jan 2021 07:49:58 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"ApplePlainTextBody"><div =
class=3D"ApplePlainTextBody"><br><br><blockquote type=3D"cite">On =
20-Jan-2021, at 1:20 PM, Nicholas Piggin &lt;npiggin@gmail.com&gt; =
wrote:<br><br>Running softirqs enables interrupts, which can then end up =
recursing<br>into the irq soft-mask code we're adjusting, including =
replaying<br>interrupts itself, which might be theoretically =
unbounded.<br><br>This abridged trace shows how this can occur:<br><br>! =
NIP replay_soft_interrupts<br> LR =
&nbsp;interrupt_exit_kernel_prepare<br> Call Trace:<br> =
&nbsp;&nbsp;interrupt_exit_kernel_prepare (unreliable)<br> =
&nbsp;&nbsp;interrupt_return<br> --- interrupt: ea0 at =
__rb_reserve_next<br> NIP __rb_reserve_next<br> LR __rb_reserve_next<br> =
Call Trace:<br> &nbsp;&nbsp;ring_buffer_lock_reserve<br> =
&nbsp;&nbsp;trace_function<br> &nbsp;&nbsp;function_trace_call<br> =
&nbsp;&nbsp;ftrace_call<br> &nbsp;&nbsp;__do_softirq<br> =
&nbsp;&nbsp;irq_exit<br> &nbsp;&nbsp;timer_interrupt<br>! =
&nbsp;&nbsp;replay_soft_interrupts<br> =
&nbsp;&nbsp;interrupt_exit_kernel_prepare<br> =
&nbsp;&nbsp;interrupt_return<br> --- interrupt: ea0 at =
arch_local_irq_restore<br><br>Fix this by disabling bhs (softirqs) =
around the interrupt replay.<br><br>I don't know that commit =
3282a3da25bd ("powerpc/64: Implement soft<br>interrupt replay in C") =
actually introduced the problem. Prior to that<br>change, the interrupt =
replay seems like it should still be subect to<br>this recusion, however =
it's done after all the irq state has been fixed<br>up at the end of the =
replay, so it seems reasonable to fix back to =
this<br>commit.<br><br>Fixes: 3282a3da25bd ("powerpc/64: Implement soft =
interrupt replay in C")<br>Signed-off-by: Nicholas Piggin =
&lt;npiggin@gmail.com&gt;<br></blockquote><br>Thanks for the fix =
Nick.<br><br>Tested this below scenario where previously it was =
resulting in soft lockup=E2=80=99s with the trace described in the =
commit message. <br>With the patch, I don=E2=80=99t see soft =
lockup=E2=80=99s.<br><br>Test scenario: My test kernel module below =
tries to create one of performance monitor<br>counter ( PMC6 ) overflow =
between local_irq_save/local_irq_restore. I am also configuring =
ftrace.<br><br>Environment :One CPU online and Bare Metal =
system<br>prerequisite for ftrace:<br># cd =
/sys/kernel/debug/tracing<br># echo 100 &gt; buffer_percent<br># echo =
200000 &gt; buffer_size_kb <br># echo ppc-tb &gt; trace_clock<br># echo =
function &gt; current_tracer<br><br>Part of sample kernel test module to =
trigger a PMI between <br>local_irq_save and =
local_irq_restore:<br><br>&lt;&lt;&gt;&gt;<br>static ulong delay =3D =
1;<br>static void busy_wait(ulong time)<br>{<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;udelay(delay);<br>}<br>static =
__always_inline void irq_test(void)<br>{<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long flags;<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;local_irq_save(flags);<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;trace_printk("IN IRQ TEST\n");<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCR0, 0x80000000);<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_PMC6, 0x80000000 - =
100);<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCR0, =
0x6004000);<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;busy_wait(delay);<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;trace_printk("IN IRQ TEST =
DONE\n");<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;local_irq_restore(flags);<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCR0, 0x80000000);<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_PMC6, =
0);<br>}<br>&lt;&lt;&gt;&gt;<br><br>With the patch, there is no soft =
lockup=E2=80=99s.<br><br>Tested-by: Athira Rajeev =
&lt;atrajeev@linux.vnet.ibm.com&gt;<br><br><blockquote =
type=3D"cite">---<br>arch/powerpc/kernel/irq.c | 14 ++++++++++++++<br>1 =
file changed, 14 insertions(+)<br><br>diff --git =
a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c<br>index =
6b1eca53e36c..7064135f9dc3 100644<br>--- =
a/arch/powerpc/kernel/irq.c<br>+++ b/arch/powerpc/kernel/irq.c<br>@@ =
-188,6 +188,18 @@ void replay_soft_interrupts(void)<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>unsigned =
char happened =3D local_paca-&gt;irq_happened;<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>struct =
pt_regs regs;<br><br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>/*<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * =
Prevent softirqs from being run when an interrupt handler =
returns<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> * and calls irq_exit(), because softirq processing enables =
interrupts.<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> * If an interrupt is taken, it may then call =
replay_soft_interrupts<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> * on its way out, which gets =
messy and recursive.<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> *<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * =
softirqs created by replayed interrupts will be run at the end =
of<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> * this function when bhs are enabled (if they were enabled in =
our<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> * caller).<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> */<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>local_bh_disable();<br>+<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>ppc_save_regs(&amp;regs);<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>regs.softe =3D =
IRQS_ENABLED;<br><br>@@ -263,6 +275,8 @@ void =
replay_soft_interrupts(void)<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>trace_hardirqs_off();<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>goto =
again;<br><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br>+<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>local_bh_enable();<br>}<br><br>notrace void =
arch_local_irq_restore(unsigned long mask)<br>-- =
<br>2.23.0<br><br></blockquote><br></div></body></html>=
