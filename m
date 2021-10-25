Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C135043A553
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 22:58:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdS2z47QCz3cVM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 07:58:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FSR7MtSu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FSR7MtSu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdM0x0XYGz2xDZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 04:10:56 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19PFkS17022142; 
 Mon, 25 Oct 2021 17:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : message-id :
 content-type : subject : date : in-reply-to : cc : to : references :
 mime-version; s=pp1; bh=8sL0BJkwFHnow0ued3vPrPk7F1JTuBR0NkdQ6dg2avM=;
 b=FSR7MtSuvYizV4N5G09kxaizEi0GZUOWwMhs9pZ2fcNLK2Nh30fPfb2bGogCycI5PatB
 PSEzO/9eXp/fQOgLE9DCNro0SiGo27hAp/65QbQEtWVMSPDcbMSg8xmo2tIdX8VQvFIW
 u7zc3cV2RtUjaLhhswl+I4+l0Eq3CTHCoXumxCtApckYqgNx45TnYsUdJr7KMlgvUZKf
 7kKPPDXYebVMYg4rGVAjj4jTHRrgEprtFKX4LN74g3/DcXYtcXJs79jPhiLjY8IfilpT
 5v0TCFegT9jBfM5ncspxFWd5aqs5BOjoXBc822eI+A1+dEqKJYGq+UaoD54fmoplVVu0 AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bwsvdv5vs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 17:10:52 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19PH0onS028861;
 Mon, 25 Oct 2021 17:10:52 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bwsvdv5uu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 17:10:52 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19PH2nKn008601;
 Mon, 25 Oct 2021 17:10:49 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3bv9njh523-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 17:10:49 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 19PH4hw860096868
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Oct 2021 17:04:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51BA8A4062;
 Mon, 25 Oct 2021 17:10:46 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1DD8A405F;
 Mon, 25 Oct 2021 17:10:43 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.195.47.16])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 25 Oct 2021 17:10:43 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <08B23107-A282-43D0-87A2-41DFFD2B4FBD@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_57307FFE-D31F-4364-8942-09DE08DD2506"
Subject: Re: [PATCH V2] powerpc/perf: Enable PMU counters post partition
 migration if PMU is active
Date: Mon, 25 Oct 2021 22:40:43 +0530
In-Reply-To: <87ilxqxoxy.fsf@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <1626006357-1611-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1634812863.5e9oss88pa.astroid@bobo.none> <87ilxqxoxy.fsf@linux.ibm.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 69v4WpWImDI5Pfrn1HvvshCuezFtEr3u
X-Proofpoint-GUID: 1x8BpK4wmY0ojojIcNVcsss-a9pePUyK
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_06,2021-10-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110250099
X-Mailman-Approved-At: Tue, 26 Oct 2021 07:56:00 +1100
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
Cc: maddy@linux.ibm.com, rnsastry@linux.ibm.com,
 Nicholas Piggin <npiggin@gmail.com>, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_57307FFE-D31F-4364-8942-09DE08DD2506
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> On 21-Oct-2021, at 11:03 PM, Nathan Lynch <nathanl@linux.ibm.com> wrote:
>=20
> Nicholas Piggin <npiggin@gmail.com <mailto:npiggin@gmail.com>> writes:
>> Excerpts from Athira Rajeev's message of July 11, 2021 10:25 pm:
>>> During Live Partition Migration (LPM), it is observed that perf
>>> counter values reports zero post migration completion. However
>>> 'perf stat' with workload continues to show counts post migration
>>> since PMU gets disabled/enabled during sched switches. But incase
>>> of system/cpu wide monitoring, zero counts were reported with 'perf
>>> stat' after migration completion.
>>>=20
>>> Example:
>>> ./perf stat -e r1001e -I 1000
>>>           time             counts unit events
>>>     1.001010437         22,137,414      r1001e
>>>     2.002495447         15,455,821      r1001e
>>> <<>> As seen in next below logs, the counter values shows zero
>>>        after migration is completed.
>>> <<>>
>>>    86.142535370    129,392,333,440      r1001e
>>>    87.144714617                  0      r1001e
>>>    88.146526636                  0      r1001e
>>>    89.148085029                  0      r1001e
>>>=20
>>> Here PMU is enabled during start of perf session and counter
>>> values are read at intervals. Counters are only disabled at the
>>> end of session. The powerpc mobility code presently does not handle
>>> disabling and enabling back of PMU counters during partition
>>> migration. Also since the PMU register values are not saved/restored
>>> during migration, PMU registers like Monitor Mode Control Register 0
>>> (MMCR0), Monitor Mode Control Register 1 (MMCR1) will not contain
>>> the value it was programmed with. Hence PMU counters will not be
>>> enabled correctly post migration.
>>>=20
>>> Fix this in mobility code by handling disabling and enabling of
>>> PMU in all cpu's before and after migration. Patch introduces two
>>> functions 'mobility_pmu_disable' and 'mobility_pmu_enable'.
>>> mobility_pmu_disable() is called before the processor threads goes
>>> to suspend state so as to disable the PMU counters. And disable is
>>> done only if there are any active events running on that cpu.
>>> mobility_pmu_enable() is called after the processor threads are
>>> back online to enable back the PMU counters.
>>>=20
>>> Since the performance Monitor counters ( PMCs) are not
>>> saved/restored during LPM, results in PMC value being zero and the
>>> 'event->hw.prev_count' being non-zero value. This causes problem
>>=20
>> Interesting. Are they defined to not be migrated, or may not be=20
>> migrated?
>=20
> PAPR may be silent on this... at least I haven't found anything yet. But
> I'm not very familiar with perf counters.
>=20
> How much assurance do we have that hardware events we've programmed on
> the source can be reliably re-enabled on the destination, with the same
> semantics? Aren't there some model-specific counters that don't make
> sense to handle this way?
>=20
>=20
>>> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm=
/rtas.h
>>> index 9dc97d2..cea72d7 100644
>>> --- a/arch/powerpc/include/asm/rtas.h
>>> +++ b/arch/powerpc/include/asm/rtas.h
>>> @@ -380,5 +380,13 @@ static inline void rtas_initialize(void) { }
>>> static inline void read_24x7_sys_info(void) { }
>>> #endif
>>>=20
>>> +#ifdef CONFIG_PPC_PERF_CTRS
>>> +void mobility_pmu_disable(void);
>>> +void mobility_pmu_enable(void);
>>> +#else
>>> +static inline void mobility_pmu_disable(void) { }
>>> +static inline void mobility_pmu_enable(void) { }
>>> +#endif
>>> +
>>> #endif /* __KERNEL__ */
>>> #endif /* _POWERPC_RTAS_H */
>>=20
>> It's not implemented in rtas, maybe consider putting this into a perf=20
>> header?
>=20
> +1

Sure, I will move this to perf_event header file

Thanks
Athira=

--Apple-Mail=_57307FFE-D31F-4364-8942-09DE08DD2506
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 21-Oct-2021, at 11:03 PM, Nathan Lynch &lt;<a =
href=3D"mailto:nathanl@linux.ibm.com" =
class=3D"">nathanl@linux.ibm.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Nicholas Piggin &lt;</span><a href=3D"mailto:npiggin@gmail.com"=
 style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">npiggin@gmail.com</a><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&gt; writes:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">Excerpts from Athira Rajeev's message =
of July 11, 2021 10:25 pm:<br class=3D""><blockquote type=3D"cite" =
class=3D"">During Live Partition Migration (LPM), it is observed that =
perf<br class=3D"">counter values reports zero post migration =
completion. However<br class=3D"">'perf stat' with workload continues to =
show counts post migration<br class=3D"">since PMU gets disabled/enabled =
during sched switches. But incase<br class=3D"">of system/cpu wide =
monitoring, zero counts were reported with 'perf<br class=3D"">stat' =
after migration completion.<br class=3D""><br class=3D"">Example:<br =
class=3D"">./perf stat -e r1001e -I 1000<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tim=
e =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;co=
unts unit events<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;1.001010437 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;22,137,414 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r1001e<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;2.002495447 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;15,455,821 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r1001e<br class=3D"">&lt;&lt;&gt;&gt; As =
seen in next below logs, the counter values shows zero<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;after migration is =
completed.<br class=3D"">&lt;&lt;&gt;&gt;<br =
class=3D"">&nbsp;&nbsp;&nbsp;86.142535370 =
&nbsp;&nbsp;&nbsp;129,392,333,440 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r1001e<br =
class=3D"">&nbsp;&nbsp;&nbsp;87.144714617 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;0 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r1001e<br =
class=3D"">&nbsp;&nbsp;&nbsp;88.146526636 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;0 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r1001e<br =
class=3D"">&nbsp;&nbsp;&nbsp;89.148085029 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;0 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r1001e<br =
class=3D""><br class=3D"">Here PMU is enabled during start of perf =
session and counter<br class=3D"">values are read at intervals. Counters =
are only disabled at the<br class=3D"">end of session. The powerpc =
mobility code presently does not handle<br class=3D"">disabling and =
enabling back of PMU counters during partition<br class=3D"">migration. =
Also since the PMU register values are not saved/restored<br =
class=3D"">during migration, PMU registers like Monitor Mode Control =
Register 0<br class=3D"">(MMCR0), Monitor Mode Control Register 1 =
(MMCR1) will not contain<br class=3D"">the value it was programmed with. =
Hence PMU counters will not be<br class=3D"">enabled correctly post =
migration.<br class=3D""><br class=3D"">Fix this in mobility code by =
handling disabling and enabling of<br class=3D"">PMU in all cpu's before =
and after migration. Patch introduces two<br class=3D"">functions =
'mobility_pmu_disable' and 'mobility_pmu_enable'.<br =
class=3D"">mobility_pmu_disable() is called before the processor threads =
goes<br class=3D"">to suspend state so as to disable the PMU counters. =
And disable is<br class=3D"">done only if there are any active events =
running on that cpu.<br class=3D"">mobility_pmu_enable() is called after =
the processor threads are<br class=3D"">back online to enable back the =
PMU counters.<br class=3D""><br class=3D"">Since the performance Monitor =
counters ( PMCs) are not<br class=3D"">saved/restored during LPM, =
results in PMC value being zero and the<br =
class=3D"">'event-&gt;hw.prev_count' being non-zero value. This causes =
problem<br class=3D""></blockquote><br class=3D"">Interesting. Are they =
defined to not be migrated, or may not be<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">migrated?<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">PAPR may be silent on this... at least I haven't found =
anything yet. But</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">I'm not very familiar with perf counters.</span><br =
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
display: inline !important;" class=3D"">How much assurance do we have =
that hardware events we've programmed on</span><br style=3D"caret-color: =
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
class=3D"">the source can be reliably re-enabled on the destination, =
with the same</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">semantics? =
Aren't there some model-specific counters that don't make</span><br =
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
display: inline !important;" class=3D"">sense to handle this =
way?</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
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
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" class=3D"">diff --git =
a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h<br =
class=3D"">index 9dc97d2..cea72d7 100644<br class=3D"">--- =
a/arch/powerpc/include/asm/rtas.h<br class=3D"">+++ =
b/arch/powerpc/include/asm/rtas.h<br class=3D"">@@ -380,5 +380,13 @@ =
static inline void rtas_initialize(void) { }<br class=3D"">static inline =
void read_24x7_sys_info(void) { }<br class=3D"">#endif<br class=3D""><br =
class=3D"">+#ifdef CONFIG_PPC_PERF_CTRS<br class=3D"">+void =
mobility_pmu_disable(void);<br class=3D"">+void =
mobility_pmu_enable(void);<br class=3D"">+#else<br class=3D"">+static =
inline void mobility_pmu_disable(void) { }<br class=3D"">+static inline =
void mobility_pmu_enable(void) { }<br class=3D"">+#endif<br =
class=3D"">+<br class=3D"">#endif /* __KERNEL__ */<br class=3D"">#endif =
/* _POWERPC_RTAS_H */<br class=3D""></blockquote><br class=3D"">It's not =
implemented in rtas, maybe consider putting this into a perf<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">header?<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">+1</span></div></blockquote></div><br class=3D""><div =
class=3D"">Sure,&nbsp;<span style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" class=3D"">I will move this to perf_event header =
file</span></div><div class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D""><br class=3D""></span></div><div =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);" class=3D"">Thanks</span></div><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">Athira</span></div></body></html>=

--Apple-Mail=_57307FFE-D31F-4364-8942-09DE08DD2506--

