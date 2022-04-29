Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7572C515721
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 23:43:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqmG43Kj5z3bpB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 07:43:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ElZ4I+aS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ElZ4I+aS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqmFM6J0pz3bbL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Apr 2022 07:43:19 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23TLbW8H025597;
 Fri, 29 Apr 2022 21:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=qB8GeE38+ah9RjhNMUdOSjuvIWZX4KzQ2zo6u1Aqd/4=;
 b=ElZ4I+aSMwwWqOa/z+gn1+26qYfrpU/BXEkOS5WQqNpjuF1ZfeSi4Rh0Fm41Xa97LMJ1
 gciBLbEps9ptVwx015X8ojdgPs2qQ2vTpJ5Ab51AZYpUZjKYR3vpWqNqu50tSeVRPlNb
 GKJuCDxInW1ZD0Nt01OX7w5up1xLDctZDiqvWpqWndQ7f0VG+J2P8vjFp0aBV6mbRjaj
 rWJdpiEFLzHphqwhQIdirXwR8O39kpSOqvdH5+vPAKPui02iNL85gIDn5oMJfxxt6qSE
 yDrflRgMWATP97KUfYlYt6qPpB6cQU+f8WvDMHN2Q6RoMnaIrySoEsruQNjEhyxxgaxn 5A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqs3ny8ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 21:43:15 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23TLhEWv018023;
 Fri, 29 Apr 2022 21:43:14 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqs3ny8u4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 21:43:14 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23TLcdAW010255;
 Fri, 29 Apr 2022 21:43:13 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 3fm93ayadg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 21:43:13 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23TLhCih6292426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Apr 2022 21:43:12 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD475AC05E;
 Fri, 29 Apr 2022 21:43:12 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F6CEAC05B;
 Fri, 29 Apr 2022 21:43:11 +0000 (GMT)
Received: from localhost (unknown [9.160.2.82])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 29 Apr 2022 21:43:10 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Rob Landley <rob@landley.net>, Thomas Huth <thuth@redhat.com>, QEMU
 Developers <qemu-devel@nongnu.org>
Subject: Re: serial hang in qemu-system-ppc64 -M pseries
In-Reply-To: <ba41f9ab-bce4-b377-e99c-caa0d8240308@landley.net>
References: <74b9755a-4b5d-56b1-86f5-0c5c7688845a@landley.net>
 <8558c117-75a0-dc73-9b1a-be128e04056c@redhat.com>
 <ba41f9ab-bce4-b377-e99c-caa0d8240308@landley.net>
Date: Fri, 29 Apr 2022 18:43:04 -0300
Message-ID: <87bkwjtvkn.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KSFdKGCTdAFY64zHlfSNhUI5XzIcaw3L
X-Proofpoint-ORIG-GUID: pwvt_XWtlgktV0D2bAV721r5qC4SdCDy
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-29_09,2022-04-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204290115
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, qemu-ppc@nongnu.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rob Landley <rob@landley.net> writes:

> On 4/27/22 10:27, Thomas Huth wrote:
>> On 26/04/2022 12.26, Rob Landley wrote:
>>> When I cut and paste 80-ish characters of text into the Linux serial console, it
>>> reads 16 characters and stops. When I hit space, it reads another 16 characters,
>>> and if I keep at it will eventually catch up without losing data. If I type,
>>> every character shows up immediately.
>> 
>> That "16" certainly comes from VTERM_BUFSIZE in hw/char/spapr_vty.c in the 
>> QEMU sources, I think.
>> 
>>> (On other qemu targets and kernels I can cut and paste an entire uuencoded
>>> binary and it goes through just fine in one go, but this target hangs with big
>>> pastes until I hit keys.)
>>> 
>>> Is this a qemu-side bug, or a kernel-side bug?
>>> 
>>> Kernel config attached (linux 5.18-rc3 or thereabouts), qemu invocation is:
>>> 
>>> qemu-system-ppc64 -M pseries -vga none -nographic -no-reboot -m 256 -kernel
>>> vmlinux -initrd powerpc64leroot.cpio.gz -append "panic=1 HOST=powerpc64le
>>> console=hvc0"
>> 
>> Which version of QEMU are you using?
>
> $ qemu-system-ppc64 --version
> QEMU emulator version 6.2.92 (v6.2.0-rc2)
> Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
>
> From november. I can pull and rebuild but it'll take a bit. (Hopefully
> rebuilding would fix the need to echo -e '\e[?7h' afterwards to undo the "bash
> command line history marches up the screen because qemu's x86 bios disabled line
> wrap and then left it that way" issue...)
>
>> Which frontend (GTK or terminal?) ... 
>
> The above command line has -nographic, forcing terminal. Running ldd on the
> binary doesn't pull up anything gtk. (It pulls up libncursesw though.)
>
> If you want to reproduce my test locally:
>
> wget https://landley.net/toybox/downloads/binaries/mkroot/0.8.5/powerpc64le.tgz
> tar xvzf powerpc64le.tgz
> cd powerpc64le
> ./qemu-*.sh
>
> Then paste something longer than 16 characters at the eventual command prompt
> once the kernel finishes booting.

I suspect this is due to how the tty driver (n_tty.c) interacts with
the console (hvc_console.c) driver's buffer size.

This is the stack:

#0 hvc_push          <-- calls into KVM/QEMU to write up to 16 bytes
#1 hvc_write
#2 tty_put_char
#3 do_output_char
#4 __process_echoes          <-- writes up to tty_write_room() chars
#5 flush_echoes              <-- returns early if ~ECHO && ~ECHONL
#6 n_tty_receive_buf_common  <-- buffers more than 16 bytes
#7 tty_ldisc_receive_buf
#8 tty_port_default_receive_buf
#9 receive_buf
#10 process_one_work

In my busybox instance which does not have this issue I can see that
termios.c_lflag = 0x447, so in the stack above #4 is not called (ECHO
is 0x8, ECHONL is 0x10).

In the bug scenario: termios.c_lflag = 0x5cf, so we go into #4 which
is supposed to write (say) 17 bytes, but ends up writing only 16
because that is what tty_write_room() returns.

What I think is causing this issue is that the hvc_vio.c driver is
configured with hp->outbuf_size = 16. That number comes from the
H_PUT_TERM_CHAR hypercall spec which reads two registers at a
time. However, the hvc_write function supports writes larger than 16
bytes so it seems we're needlessly propagating the 16 byte limitation
to the upper layer.

The driver is also not buffering the write, so if it gets called to
write one char at a time (like __process_echoes does) there should be no
limit to how much it can write.

I think if we increase hp->outbuf_size to a value that is larger than
N_TTY_BUF_SIZE=4096 the echo buffer would drain before reaching this new
hvc driver limit.

I tested that and it seems to work, but I'm not sure if it's the right
fix, there are some things I couldn't figure out:

   i) if a driver actually runs out of buffer space, what
      __process_echoes should do about it;

  ii) why the bug sometimes happens only at the 32 characters boundary
      (or other multiple of 16);

 iii) why the ECHO flag differs from the working case.

> If you want to reproduce it all from source:
>
> git clone https://github.com/landley/toybox
> cd toybox && mkdir ccc && cd ccc
> wget
> https://landley.net/toybox/downloads/binaries/toolchains/latest/powerpc64le-linux-musl-cross.tar.xz
> -O - | tar xv
> cd ..
> CROSS=powerpc64le LINUX=~/linux scripts/mkroot.sh
> cd root/powerpc64le
> ./qemu-*.sh
>
> This assumes your linux kernel source directory is in ~/linux of course, and
> that qemu-system-ppc64 is in the $PATH...
>
>> this rings a distant bell, but I thought we had fixed these issues long ago 
>> in the past... e.g.:
>>
>> https://yhbt.net/lore/all/1380113886-16845-10-git-send-email-mdroth@linux.vnet.ibm.com/
>> 
>> https://git.qemu.org/?p=qemu.git;a=commitdiff;h=8a273cbe53221d28
>
> The qemu I'm running is newer than 2016. :)
>
> Most targets are fine with this: I cut and paste entire uuencoded binaries into
> the serial console as an easy way to insert a file into an initramfs. It can
> usually take multiple megabytes without dropping a character, so you just
> "uudecode" enter, and then paste.
>
> Even my 32 bit powerpc target works fine with this. (Although -M g3beige is a

> very different machine from -M pseries...)
>
> Alas this target (and sh4 -m r2d) stop at 16 chars. (On sh4 the extra is
> discarded, not delivered progressively as more interrupts are generated.)
>
>> ... but maybe my memory also just fails and this has never been properly fixed.
>> 
>>   Thomas
>
> Rob
