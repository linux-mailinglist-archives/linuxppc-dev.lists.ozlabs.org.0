Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4AE3102DC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 03:38:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX03L244DzDqJS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 13:38:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CmwyVSzS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX01k4S6TzDqCT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 13:37:14 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1152Y1Kc151135; Thu, 4 Feb 2021 21:37:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=cVk8+dZbftUigzILoD6tALbd0yXygm2MoC+Q55b7hM4=;
 b=CmwyVSzSxtMAI/YENfvHXIdUDLmuv9iqkw9bGUV+SXT18WAV8XPgOyyIZXOA5TTFkGAx
 0hsajgwsS1iRkJxXYgTBhzRu5dbcBIOZS+D8Y0FiJjOxfTJTF60ZYv9kclq+K7oycWhH
 4eq8KUhvqPHthEIA1lACxVBp7DQLEzvW5zrZ+WItyfI2AVfuAxF828Y72j2X8TQhnvjs
 ArlFE43+LFsuXUwo/I+yPn1D8tOqnDN8GpTJUMNdmzqZEEuZD+nBA/6t0c8ywwVNiJ0S
 2/e5Heq/TDBZM2uVIM4MvTkhGK6jx84lg20bjGDryNZBLG8JxHQS22fpkWhVRDDKs3Xx dw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gsyn47y5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 21:37:07 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1152XfS6016415;
 Fri, 5 Feb 2021 02:37:05 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 36g2a90nwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 02:37:05 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1152b2PY42926442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Feb 2021 02:37:02 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CE9EA404D;
 Fri,  5 Feb 2021 02:37:02 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68830A4040;
 Fri,  5 Feb 2021 02:37:01 +0000 (GMT)
Received: from [9.79.255.184] (unknown [9.79.255.184])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  5 Feb 2021 02:37:01 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] powerpc/perf: Record counter overflow always if SAMPLE_IP
 is unset
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <87pn1gpmnl.fsf@mpe.ellerman.id.au>
Date: Fri, 5 Feb 2021 08:06:58 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <C1BA7EFE-B791-4C15-948F-F881068650AE@linux.vnet.ibm.com>
References: <1612342484-1404-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <87pn1gpmnl.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_13:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102050015
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 04-Feb-2021, at 8:25 AM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>> While sampling for marked events, currently we record the sample only
>> if the SIAR valid bit of Sampled Instruction Event Register (SIER) is
>> set. SIAR_VALID bit is used for fetching the instruction address from
>> Sampled Instruction Address Register(SIAR). But there are some =
usecases,
>> where the user is interested only in the PMU stats at each counter
>> overflow and the exact IP of the overflow event is not required.
>> Dropping SIAR invalid samples will fail to record some of the counter
>> overflows in such cases.
>>=20
>> Example of such usecase is dumping the PMU stats (event counts)
>> after some regular amount of instructions/events from the userspace
>> (ex: via ptrace). Here counter overflow is indicated to userspace via
>> signal handler, and captured by monitoring and enabling I/O
>> signaling on the event file descriptor. In these cases, we expect to
>> get sample/overflow indication after each specified sample_period.
>>=20
>> Perf event attribute will not have PERF_SAMPLE_IP set in the
>> sample_type if exact IP of the overflow event is not requested. So
>> while profiling if SAMPLE_IP is not set, just record the counter =
overflow
>> irrespective of SIAR_VALID check.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> arch/powerpc/perf/core-book3s.c | 10 ++++++++--
>> 1 file changed, 8 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
>> index 28206b1fe172..bb4828a05e4d 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -2166,10 +2166,16 @@ static void record_and_restart(struct =
perf_event *event, unsigned long val,
>> 	 * address even when freeze on supervisor state (kernel) is set =
in
>> 	 * MMCR2. Check attr.exclude_kernel and address to drop the =
sample in
>> 	 * these cases.
>> +	 *
>> +	 * If address is not requested in the sample
>> +	 * via PERF_SAMPLE_IP, just record that sample
>> +	 * irrespective of SIAR valid check.
>> 	 */
>> -	if (event->attr.exclude_kernel && record)
>> -		if (is_kernel_addr(mfspr(SPRN_SIAR)))
>> +	if (event->attr.exclude_kernel && record) {
>> +		if (is_kernel_addr(mfspr(SPRN_SIAR)) && =
(event->attr.sample_type & PERF_SAMPLE_IP))
>> 			record =3D 0;
>> +	} else if (!record && !(event->attr.sample_type & =
PERF_SAMPLE_IP))
>> +		record =3D 1;
>=20
> This seems wrong, you're assuming that record was set previously to
> =3D siar_valid(), but it may be that record is still 0 from the
> initialisation and we weren't going to record.
>=20
> Don't we need something more like this?

Hi Michael,

Thanks for checking the patch and sharing the suggestion.

Yes, the below change looks good and tested with my scenario.=20
I will send a V2 with new change.

Thanks
Athira
>=20
> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
> index 9fd06010e8b6..e4e8a017d339 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2136,7 +2136,12 @@ static void record_and_restart(struct =
perf_event *event, unsigned long val,
> 			left +=3D period;
> 			if (left <=3D 0)
> 				left =3D period;
> -			record =3D siar_valid(regs);
> +
> +			if (event->attr.sample_type & PERF_SAMPLE_IP)
> +				record =3D siar_valid(regs);
> +			else
> +				record =3D 1;
> +
> 			event->hw.last_period =3D =
event->hw.sample_period;
> 		}
> 		if (left < 0x80000000LL)
> @@ -2154,9 +2159,10 @@ static void record_and_restart(struct =
perf_event *event, unsigned long val,
> 	 * MMCR2. Check attr.exclude_kernel and address to drop the =
sample in
> 	 * these cases.
> 	 */
> -	if (event->attr.exclude_kernel && record)
> -		if (is_kernel_addr(mfspr(SPRN_SIAR)))
> -			record =3D 0;
> +	if (event->attr.exclude_kernel &&
> +	    (event->attr.sample_type & PERF_SAMPLE_IP) &&
> +	    is_kernel_addr(mfspr(SPRN_SIAR)))
> +		record =3D 0;
>=20
> 	/*
> 	 * Finally record data if requested.
>=20
>=20
>=20
> cheers

