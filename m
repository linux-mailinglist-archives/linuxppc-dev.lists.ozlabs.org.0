Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC60B23E5BD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 04:13:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BN86b0HYgzDqv5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 12:13:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jIn5HYif; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BN84l0XWLzDqsZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 12:12:05 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0772149k009865; Thu, 6 Aug 2020 22:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=VXljsUSqKdMZUfG4LefmGHTN/HjAin0NYssO1OfIiJw=;
 b=jIn5HYifyI193iK/ItfkqBP5XCfapDNeQTggs1eBMDMnIavnhAH/vO/l5CMNGrx0DoZO
 VGSKaG13nU1jd7okEUtedHxUfClrNuod6VJabvl1IpSfgIjC/ZED0c7QVEoRcvqYt2wa
 uCGaJUCCtdB0zlgkOxLK9bd4HnDJwwhy5g+9Kn5mJtO/+ddzCB3BQHCrYJFAt1PNclnN
 wsrgkmWdK5Hmi5Jbf0/q3/+HzKrpnYmqnJwcLxCJEXW46p6nZPHrfYNTI/eLF48CUKtu
 ADdsbq09Bf1LKNYXFPB6/nSGHENmorPUKb8Ir8BcQKr+wuw6O7YAiwk648vCA4MzPY0p CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32r9wuea5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 22:12:01 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07722NQs013793;
 Thu, 6 Aug 2020 22:12:01 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32r9wuea4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 22:12:00 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07726LB8032201;
 Fri, 7 Aug 2020 02:11:59 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 32n01863j4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 02:11:59 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0772ATfi43909516
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Aug 2020 02:10:29 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C83FA4062;
 Fri,  7 Aug 2020 02:11:56 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABBAAA4060;
 Fri,  7 Aug 2020 02:11:53 +0000 (GMT)
Received: from [9.77.207.131] (unknown [9.77.207.131])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  7 Aug 2020 02:11:53 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH V5 0/4] powerpc/perf: Add support for perf extended regs
 in powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20200806122052.GC71359@kernel.org>
Date: Fri, 7 Aug 2020 07:41:51 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <DD5B45AA-37D5-4517-84A5-DE8D82BC1196@linux.vnet.ibm.com>
References: <1595870184-1460-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <27D1CE26-A506-4CFF-B1C2-E0545F26E637@linux.vnet.ibm.com>
 <20200730195048.GA1484375@krava>
 <CA3D75F3-5F63-425B-A3C1-00C181E41108@linux.vnet.ibm.com>
 <20200806122052.GC71359@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-06_17:2020-08-06,
 2020-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=914
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxscore=0 phishscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008070010
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Michael Neuling <mikey@neuling.org>, maddy@linux.vnet.ibm.com,
 kajoljain <kjain@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Jiri Olsa <jolsa@kernel.org>, Jiri Olsa <jolsa@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 06-Aug-2020, at 5:50 PM, Arnaldo Carvalho de Melo <acme@kernel.org> =
wrote:
>=20
> Em Fri, Jul 31, 2020 at 11:04:14PM +0530, Athira Rajeev escreveu:
>>=20
>>=20
>>> On 31-Jul-2020, at 1:20 AM, Jiri Olsa <jolsa@redhat.com> wrote:
>>>=20
>>> On Thu, Jul 30, 2020 at 01:24:40PM +0530, Athira Rajeev wrote:
>>>>=20
>>>>=20
>>>>> On 27-Jul-2020, at 10:46 PM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>>>>>=20
>>>>> Patch set to add support for perf extended register capability in
>>>>> powerpc. The capability flag PERF_PMU_CAP_EXTENDED_REGS, is used =
to
>>>>> indicate the PMU which support extended registers. The generic =
code
>>>>> define the mask of extended registers as 0 for non supported =
architectures.
>>>>>=20
>>>>> Patches 1 and 2 are the kernel side changes needed to include
>>>>> base support for extended regs in powerpc and in power10.
>>>>> Patches 3 and 4 are the perf tools side changes needed to support =
the
>>>>> extended registers.
>>>>>=20
>>>>=20
>>>> Hi Arnaldo, Jiri
>>>>=20
>>>> please let me know if you have any comments/suggestions on this =
patch series to add support for perf extended regs.
>>>=20
>>> hi,
>>> can't really tell for powerpc, but in general
>>> perf tool changes look ok
>>>=20
>>=20
>> Hi Jiri,
>> Thanks for checking the patchset.
>=20
> So I'dd say you submit a v6, split into the kernel part, that probably
> should go via the PPC arch tree, and I can pick the tooling part, ok?
>=20
> - Arnaldo

Sure Arnaldo, I will send a v6.

Thanks,
Athira=
