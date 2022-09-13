Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 893AB5B7714
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 19:03:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRqY94jCpz3c65
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 03:03:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rm6q2eGQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rm6q2eGQ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRqXV26cJz2y6N
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 03:02:49 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DGlEDR031892;
	Tue, 13 Sep 2022 17:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Uq3skbboDhKZ8FFGCxQ4C3VXYnnb0vVBTlq5zNym1dw=;
 b=Rm6q2eGQ+2zWejWYmkt6NokLHT/kmPqOXgI0pIit6vrcWDSqkAsBbhHlT5T7kGhCo1LZ
 FT62H9vOuj6N8pYqQAfAKf8MBXsn/BJB1TKSTVcgPFfOPKh+7tig3XI3bVrSdmu97gwZ
 je1hHq/gMHBrQruhAcfiyYr0d1VKVdFNznUCk0+SGTTJo7tVESE7ErfqMT8bCue3lOrS
 J5Uh48+u7LCuym2veK2F2JMlGtPSLQ3Rn4hSLqyJUOkNlW2oJqWbmTsFKR3aE6X37p7J
 jSRe96sErkCjcEOnmDvbqvpAWBjsuMEnNfH/wD4k2lvT+iNmVlBYCbC/q4xduZFCfQa6 zQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjwpjgek0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 17:02:44 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28DGodCR015481;
	Tue, 13 Sep 2022 17:02:43 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma05wdc.us.ibm.com with ESMTP id 3jgj7a5ak6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 17:02:43 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28DH2hRk10683006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Sep 2022 17:02:43 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0AC1112063;
	Tue, 13 Sep 2022 17:02:42 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4FDE112065;
	Tue, 13 Sep 2022 17:02:42 +0000 (GMT)
Received: from localhost (unknown [9.65.113.132])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
	Tue, 13 Sep 2022 17:02:42 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH] powerpc/pseries: add lparctl driver for
 platform-specific functions
In-Reply-To: <20220913163343.GA28810@kitsune.suse.cz>
References: <20220730000458.130938-1-nathanl@linux.ibm.com>
 <0ead0cd1-f6f6-ecf0-65d9-f3d9366e258c@linux.ibm.com>
 <87k07dl1f6.fsf@linux.ibm.com> <20220913091302.GY28810@kitsune.suse.cz>
 <87v8prtgcj.fsf@linux.ibm.com> <20220913163343.GA28810@kitsune.suse.cz>
Date: Tue, 13 Sep 2022 12:02:42 -0500
Message-ID: <87sfkvtdfx.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6ZRsEUPm8Y16IVezpCsku13IaMzYke_1
X-Proofpoint-GUID: 6ZRsEUPm8Y16IVezpCsku13IaMzYke_1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_09,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130075
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org, Chun-Yi <jlee@suse.com>, Lee@kitsune.suse.cz, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> On Tue, Sep 13, 2022 at 10:59:56AM -0500, Nathan Lynch wrote:
>> Michal Such=C3=A1nek <msuchanek@suse.de> writes:
>>=20
>> > On Fri, Aug 12, 2022 at 02:14:21PM -0500, Nathan Lynch wrote:
>> >> Laurent Dufour <ldufour@linux.ibm.com> writes:
>> >> > Le 30/07/2022 =C3=A0 02:04, Nathan Lynch a =C3=A9crit=C2=A0:
>> >> >> +static long lparctl_get_sysparm(struct lparctl_get_system_paramet=
er __user *argp)
>> >> >> +{
>> >> >> +	struct lparctl_get_system_parameter *gsp;
>> >> >> +	long ret;
>> >> >> +	int fwrc;
>> >> >> +
>> >> >> +	/*
>> >> >> +	 * Special case to allow user space to probe the command.
>> >> >> +	 */
>> >> >> +	if (argp =3D=3D NULL)
>> >> >> +		return 0;
>> >> >> +
>> >> >> +	gsp =3D memdup_user(argp, sizeof(*gsp));
>> >> >> +	if (IS_ERR(gsp)) {
>> >> >> +		ret =3D PTR_ERR(gsp);
>> >> >> +		goto err_return;
>> >> >> +	}
>> >> >> +
>> >> >> +	ret =3D -EINVAL;
>> >> >> +	if (gsp->rtas_status !=3D 0)
>> >> >> +		goto err_free;
>> >> >> +
>> >> >> +	do {
>> >> >> +		static_assert(sizeof(gsp->data) <=3D sizeof(rtas_data_buf));
>> >> >> +
>> >> >> +		spin_lock(&rtas_data_buf_lock);
>> >> >> +		memset(rtas_data_buf, 0, sizeof(rtas_data_buf));
>> >> >> +		memcpy(rtas_data_buf, gsp->data, sizeof(gsp->data));
>> >> >> +		fwrc =3D rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
>> >> >> +				 NULL, gsp->token, __pa(rtas_data_buf),
>> >> >> +				 sizeof(gsp->data));
>> >> >> +		if (fwrc =3D=3D 0)
>> >> >> +			memcpy(gsp->data, rtas_data_buf, sizeof(gsp->data));
>> >> >
>> >> > May be the amount of data copied out to the user space could be
>> >> > gsp->length. This would prevent copying 4K bytes all the time.
>> >> >
>> >> > In a more general way, the size of the RTAS buffer is quite big, an=
d I'm
>> >> > wondering if all the data need to be copied back and forth to the k=
ernel.
>> >> >
>> >> > Unless there are a high frequency of calls this doesn't make sense,=
 and
>> >> > keeping the code simple might be the best way. Otherwise limiting t=
he bytes
>> >> > copied could help a bit.
>> >>=20
>> >> This is not intended to be a high-bandwidth interface and I don't thi=
nk
>> >> there's much of a performance concern here, so I'd rather just keep t=
he
>> >> copy sizes involved constant.
>> >
>> > But that's absolutely horrible!
>>=20
>> ?
>>=20
>> > The user wants the VPD data, all of it. And you only give one page with
>> > this interface.
>>=20
>> The code here is for system parameters, which have a known maximum size,
>> unlike VPD. There's no code for VPD retrieval in this patch.
>
> But we do need to support the calls that return multiple pages of data.
>
> If the new driver supports only the simple calls it's a failure.

Michal, will you please moderate your tone? I think you can communicate
your concerns without calling my work "absolutely horrible" or a
"failure". Thanks.

Anyway, of course I intend to support the more complex calls, but
supporting the simple calls actually unbreaks a lot of stuff.

>> But I'm happy to constructively discuss how a VPD ioctl interface should
>> work.
>>=20
>> > Worse, the call is not reentrant so you need to lock against other use=
rs
>> > calling the call while the current caller is retrieving the inidividual
>> > pagaes.
>> >
>> > You could do that per process, but then processes with userspace
>> > threading would want the data as well so you would have to save the
>> > arguments of the last call, and compare to arguments of any subsequent
>> > call to determine if you can let it pass or block.
>> >
>> > And when you do all that there will be a process that retrieves a coup=
le
>> > of pages and goes out for lunch or loses interest completely, blocking
>> > out everyone from accessing the interface at all.
>>=20
>> Right, the ibm,get-vpd RTAS function is tricky to expose to user space.
>>=20
>> It needs to be called repeatedly until all data has been returned, 4KB
>> at a time.
>>=20
>> Only one ibm,get-vpd sequence can be in progress at any time. If an
>> ibm,get-vpd sequence is begun while another sequence is already
>> outstanding, the first one is invalidated -- I would guess -1 or some
>> other error is returned on its next call.
>>=20
>> So a new system-call level interface for VPD retrieval probably should
>> not expose the repeating sequence-based nature of the RTAS function to
>> user space, to prevent concurrent clients from interfering with each
>> other. That implies that the kernel should buffer the VPD results
>> internally; at least that's the only idea I've had so far. Open to
>> other suggestions.
>
> It can save the data to an user-supplied buffer until all data is
> transferred or the buffer space runs out.

Yes, of course, thanks. Assuming user space can discover the appropriate
buffer size, which should be possible.
