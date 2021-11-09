Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C68544B9D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 01:56:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hpmdb1wFSz3c4x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 11:56:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ELc/AIMm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ELc/AIMm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpYVj6Y4Vz2xY5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 03:35:09 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A9FfcgQ009182; 
 Tue, 9 Nov 2021 16:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : mime-version :
 content-type : from : in-reply-to : date : cc : content-transfer-encoding
 : message-id : references : to; s=pp1;
 bh=+/g7DqYIcE+HENzoAIZl8b1K21StGekxtWTlxYDfoGo=;
 b=ELc/AIMmEDXORRQ+wlOjAIUFBDd9DrhF0LH/pdcNEB/kYv3fHroF09ua0S9Jom8oGZAb
 LeONdwqxj4VBRS/qmYe3VVJpPRfUPG7MY+CeyCwTXBv0lZxKPMAjQzZtsK1N+u111vOv
 KwYMJOuMwvQSWfjDpRGPQphkwGuhhiHmWLEbPzXFKwr9fWh3Ousc53xox/xXn3NUgrYL
 N1t9cSA/iiy+B5P2YZCsQ8hiQ4Uk4Fb5Ax8oA3Sq6SStfrFvI+qfW8OFlyQNe4lmHTyZ
 LyDTJJwnsuiA9BdXk20Ft1+YVljBG8Obz/xNEKQsRQXUyfNIdn2YnOcEr1Q7RHdcaXk1 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c7tmx3kag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 16:35:01 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A9Fhwnh018810;
 Tue, 9 Nov 2021 16:35:01 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c7tmx3k9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 16:35:01 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A9GHuh8018474;
 Tue, 9 Nov 2021 16:34:59 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3c5gyjjb91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 16:34:59 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A9GYtmI6226608
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Nov 2021 16:34:56 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D65584C04E;
 Tue,  9 Nov 2021 16:34:55 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BDD94C058;
 Tue,  9 Nov 2021 16:34:54 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.79.189.140])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  9 Nov 2021 16:34:53 +0000 (GMT)
Subject: Re: [V3] powerpc/perf: Enable PMU counters post partition migration
 if PMU is active
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Content-Type: text/html;
	charset=us-ascii
X-Apple-Auto-Saved: 1
X-Apple-Mail-Remote-Attachments: YES
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
X-Apple-Base-Url: x-msg://16/
In-Reply-To: <877ddo8nyc.fsf@mpe.ellerman.id.au>
X-Apple-Windows-Friendly: 1
Date: Tue, 9 Nov 2021 22:02:49 +0530
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
Message-Id: <D940A8FF-7159-49E9-B3A8-5959EDA0BF17@linux.vnet.ibm.com>
References: <20211029030510.58797-1-atrajeev@linux.vnet.ibm.com>
 <1635487923.hwdpof7s4v.astroid@bobo.none> <87sfwk7z0m.fsf@mpe.ellerman.id.au>
 <1635852231.aebe6lt6u4.astroid@bobo.none> <8735odx7us.fsf@linux.ibm.com>
 <877ddo8nyc.fsf@mpe.ellerman.id.au>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HMwRuDwLErOlgsN8I7GikxFpa5zyH39V
X-Proofpoint-ORIG-GUID: xXEReNlTZz5CDud3_glNBlW_D7-XF4Uz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_04,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111090097
X-Mailman-Approved-At: Wed, 10 Nov 2021 11:56:13 +1100
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, maddy@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com, kjain@linux.ibm.com,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;"><meta =
http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"><div=
 style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break: =
after-white-space;" class=3D""><br class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On =
04-Nov-2021, at 11:25 AM, Michael Ellerman &lt;<a =
href=3D"mailto:mpe@ellerman.id.au" class=3D"">mpe@ellerman.id.au</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Nathan Lynch &lt;</span><a =
href=3D"mailto:nathanl@linux.ibm.com" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">nathanl@linux.ibm.com</a><span=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">&gt; writes:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D"">Nicholas Piggin &lt;<a href=3D"mailto:npiggin@gmail.com" =
class=3D"">npiggin@gmail.com</a>&gt; writes:<br class=3D""><blockquote =
type=3D"cite" class=3D"">Excerpts from Michael Ellerman's message of =
October 29, 2021 11:15 pm:<br class=3D""><blockquote type=3D"cite" =
class=3D"">Nicholas Piggin &lt;<a href=3D"mailto:npiggin@gmail.com" =
class=3D"">npiggin@gmail.com</a>&gt; writes:<br class=3D""><blockquote =
type=3D"cite" class=3D"">Excerpts from Athira Rajeev's message of =
October 29, 2021 1:05 pm:<br class=3D""><blockquote type=3D"cite" =
class=3D"">@@ -631,12 +632,18 @@ static int =
pseries_migrate_partition(u64 handle)<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(ret)<br class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>return ret;<br class=3D""><br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/* =
Disable PMU before suspend */<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>on_each_cpu(&amp;mobility_pmu_disable, NULL, 0);<br =
class=3D""></blockquote><br class=3D"">Why was this moved out of stop =
machine and to an IPI?<br class=3D""><br class=3D"">My concern would be, =
what are the other CPUs doing at this time? Is it<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">possible =
they could take interrupts and schedule? Could that mess up the<br =
class=3D"">perf state here?<br class=3D""></blockquote><br =
class=3D"">pseries_migrate_partition() is called directly from =
migration_store(),<br class=3D"">which is the sysfs store function, =
which can be called concurrently by<br class=3D"">different CPUs.<br =
class=3D""><br class=3D"">It's also potentially called from =
rtas_syscall_dispatch_ibm_suspend_me(),<br class=3D"">from sys_rtas(), =
again with no locking.<br class=3D""><br class=3D"">So we could have two =
CPUs calling into here at the same time, which<br class=3D"">might not =
crash, but is unlikely to work well.<br class=3D""><br class=3D"">I =
think the lack of locking might have been OK in the past because only<br =
class=3D"">one CPU will successfully get the other CPUs to call =
do_join() in<br class=3D"">pseries_suspend(). But I could be wrong.<br =
class=3D""><br class=3D"">Anyway, now that we're mutating the PMU state =
before suspending we need<br class=3D"">to be more careful. So I think =
we need a lock around the whole<br class=3D"">sequence.<br =
class=3D""></blockquote></blockquote><br class=3D"">Regardless of the =
outcome here, generally agreed that some serialization<br =
class=3D"">should be imposed in this path. The way the platform works =
(and some<br class=3D"">extra measures by the drmgr utility) make it so =
that this code isn't<br class=3D"">entered concurrently in usual =
operation, but it's possible to make it<br class=3D"">happen if you are =
root.<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Yeah I agree it's unlikely to be a problem in =
practice.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">A =
file-static mutex should be OK.<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Ack.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" class=3D"">My concern is still that =
we wouldn't necessarily have the other CPUs<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">under =
control at that point even if we serialize the migrate path.<br =
class=3D"">They could take interrupts, possibly call into perf subsystem =
after<br class=3D"">the mobility_pmu_disable (e.g., via syscall or =
context switch) which<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">might mess =
things up.<br class=3D""><br class=3D"">I think the stop machine is a =
reasonable place for the code in this<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">case. It's a =
low level disabling of hardware facility and saving off<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">registers.<br =
class=3D""></blockquote><br class=3D"">That makes sense, but I can't =
help feeling concerned still. For this to<br class=3D"">be safe, =
power_pmu_enable() and power_pmu_disable() must never sleep or<br =
class=3D"">re-enable interrupts or send IPIs. I don't see anything =
obviously unsafe<br class=3D"">right now, but is that already part of =
their contract? Is there much<br class=3D"">risk they could change in =
the future to violate those constraints?<br class=3D""><br class=3D"">That=
 aside, the proposed change seems like we would be hacking around a<br =
class=3D"">more generic perf/pmu limitation in a powerpc-specific way. I =
see the<br class=3D"">same behavior on x86 across suspend/resume.<br =
class=3D""><br class=3D""># perf stat -a -e cache-misses -I 1000 &amp; =
sleep 2 ; systemctl suspend ; sleep 20 ; kill $(jobs -p)<br class=3D"">[1]=
 189806<br class=3D""># =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;time =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;co=
unts unit events<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;1.000501710 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9,983,649 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cache-misses<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;2.002620321 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;14,131,072 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cache-misses<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;3.004579071 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;23,010,971 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cache-misses<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;9.971854783 140,737,491,680,853 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cache-misses<br =
class=3D"">&nbsp;&nbsp;&nbsp;10.982669250 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;0 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cache-misses<br =
class=3D"">&nbsp;&nbsp;&nbsp;11.984660498 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;0 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cache-misses<br =
class=3D"">&nbsp;&nbsp;&nbsp;12.986648392 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;0 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cache-misses<br =
class=3D"">&nbsp;&nbsp;&nbsp;13.988561766 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;0 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cache-misses<br =
class=3D"">&nbsp;&nbsp;&nbsp;14.992670615 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;0 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cache-misses<br =
class=3D"">&nbsp;&nbsp;&nbsp;15.994938111 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;0 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cache-misses<br =
class=3D"">&nbsp;&nbsp;&nbsp;16.996703952 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;0 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cache-misses<br =
class=3D"">&nbsp;&nbsp;&nbsp;17.999092812 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;0 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cache-misses<br =
class=3D"">&nbsp;&nbsp;&nbsp;19.000602677 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;0 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cache-misses<br =
class=3D"">&nbsp;&nbsp;&nbsp;20.003272216 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;0 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cache-misses<br =
class=3D"">&nbsp;&nbsp;&nbsp;21.004770295 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;0 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cache-misses<br class=3D""># uname -r<br =
class=3D"">5.13.19-100.fc33.x86_64<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">That is interesting.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Athira, I guess we should bring =
that to the perf maintainers and see if</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">there's any interest in solving the issue in a generic =
fashion.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><div><br class=3D""></div>Sure, =
will work on proposal to start discussion with the =
community.</div><div><br =
class=3D""></div><div>Thanks</div><div>Athira&nbsp;<br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" =
class=3D"">cheers</span></div></blockquote></div><br =
class=3D""></div></body></html>=
