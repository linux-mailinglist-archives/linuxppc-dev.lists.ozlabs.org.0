Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D93285B75F8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 18:00:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRp8n55l2z3c6m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 02:00:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JQVvPUPe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JQVvPUPe;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRp835W4yz2xHk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 02:00:03 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DFgmZA015914;
	Tue, 13 Sep 2022 16:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Ze7Wo8vSz+6FKCjW0hwogxOYp7L41cMHnUC+rihIgFg=;
 b=JQVvPUPev3xmj98nDshQdgxsjrfUHYUJZK2tajxS7ngxuLOIC/2TCbBgy6s3/KFQS/9D
 vWvxhM6lUQEJsLGWChLdOBPG6TPAMV/uScaBlidDUa8i+m7xVTX7yDu7mCbjzJYFDFw6
 ktD4VU7BT6Oj65IboElGqjyZpAF2lfAI04H+qdjSZbqcGM8UsCm30uP8yBcMWF0Q067X
 0MvgxzmZXEglp3jH61aryPObUdeyoc/3SCSHNFo4PPOBWeXFKYGa3sDc1SXCPSnt2OAY
 8no87CFwrzfBiRKpSYci4cbfd5U1txvhL85AMupQXgrhsM1SR5aEY3YKxDhTpRUrfas1 OA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjvfmh8sw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 15:59:59 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28DFrorc009784;
	Tue, 13 Sep 2022 15:59:58 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma04dal.us.ibm.com with ESMTP id 3jgj7aa7qu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 15:59:58 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28DFxvpW54329780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Sep 2022 15:59:57 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6911EB2065;
	Tue, 13 Sep 2022 15:59:57 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D4F9B2064;
	Tue, 13 Sep 2022 15:59:57 +0000 (GMT)
Received: from localhost (unknown [9.65.113.132])
	by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
	Tue, 13 Sep 2022 15:59:57 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH] powerpc/pseries: add lparctl driver for
 platform-specific functions
In-Reply-To: <20220913091302.GY28810@kitsune.suse.cz>
References: <20220730000458.130938-1-nathanl@linux.ibm.com>
 <0ead0cd1-f6f6-ecf0-65d9-f3d9366e258c@linux.ibm.com>
 <87k07dl1f6.fsf@linux.ibm.com> <20220913091302.GY28810@kitsune.suse.cz>
Date: Tue, 13 Sep 2022 10:59:56 -0500
Message-ID: <87v8prtgcj.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RhmzO3p18zxa09I7k7_M15KmfaprDV36
X-Proofpoint-GUID: RhmzO3p18zxa09I7k7_M15KmfaprDV36
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_07,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130071
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

> On Fri, Aug 12, 2022 at 02:14:21PM -0500, Nathan Lynch wrote:
>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>> > Le 30/07/2022 =C3=A0 02:04, Nathan Lynch a =C3=A9crit=C2=A0:
>> >> +static long lparctl_get_sysparm(struct lparctl_get_system_parameter =
__user *argp)
>> >> +{
>> >> +	struct lparctl_get_system_parameter *gsp;
>> >> +	long ret;
>> >> +	int fwrc;
>> >> +
>> >> +	/*
>> >> +	 * Special case to allow user space to probe the command.
>> >> +	 */
>> >> +	if (argp =3D=3D NULL)
>> >> +		return 0;
>> >> +
>> >> +	gsp =3D memdup_user(argp, sizeof(*gsp));
>> >> +	if (IS_ERR(gsp)) {
>> >> +		ret =3D PTR_ERR(gsp);
>> >> +		goto err_return;
>> >> +	}
>> >> +
>> >> +	ret =3D -EINVAL;
>> >> +	if (gsp->rtas_status !=3D 0)
>> >> +		goto err_free;
>> >> +
>> >> +	do {
>> >> +		static_assert(sizeof(gsp->data) <=3D sizeof(rtas_data_buf));
>> >> +
>> >> +		spin_lock(&rtas_data_buf_lock);
>> >> +		memset(rtas_data_buf, 0, sizeof(rtas_data_buf));
>> >> +		memcpy(rtas_data_buf, gsp->data, sizeof(gsp->data));
>> >> +		fwrc =3D rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
>> >> +				 NULL, gsp->token, __pa(rtas_data_buf),
>> >> +				 sizeof(gsp->data));
>> >> +		if (fwrc =3D=3D 0)
>> >> +			memcpy(gsp->data, rtas_data_buf, sizeof(gsp->data));
>> >
>> > May be the amount of data copied out to the user space could be
>> > gsp->length. This would prevent copying 4K bytes all the time.
>> >
>> > In a more general way, the size of the RTAS buffer is quite big, and I=
'm
>> > wondering if all the data need to be copied back and forth to the kern=
el.
>> >
>> > Unless there are a high frequency of calls this doesn't make sense, and
>> > keeping the code simple might be the best way. Otherwise limiting the =
bytes
>> > copied could help a bit.
>>=20
>> This is not intended to be a high-bandwidth interface and I don't think
>> there's much of a performance concern here, so I'd rather just keep the
>> copy sizes involved constant.
>
> But that's absolutely horrible!

?

> The user wants the VPD data, all of it. And you only give one page with
> this interface.

The code here is for system parameters, which have a known maximum size,
unlike VPD. There's no code for VPD retrieval in this patch.

But I'm happy to constructively discuss how a VPD ioctl interface should
work.

> Worse, the call is not reentrant so you need to lock against other users
> calling the call while the current caller is retrieving the inidividual
> pagaes.
>
> You could do that per process, but then processes with userspace
> threading would want the data as well so you would have to save the
> arguments of the last call, and compare to arguments of any subsequent
> call to determine if you can let it pass or block.
>
> And when you do all that there will be a process that retrieves a couple
> of pages and goes out for lunch or loses interest completely, blocking
> out everyone from accessing the interface at all.

Right, the ibm,get-vpd RTAS function is tricky to expose to user space.

It needs to be called repeatedly until all data has been returned, 4KB
at a time.

Only one ibm,get-vpd sequence can be in progress at any time. If an
ibm,get-vpd sequence is begun while another sequence is already
outstanding, the first one is invalidated -- I would guess -1 or some
other error is returned on its next call.

So a new system-call level interface for VPD retrieval probably should
not expose the repeating sequence-based nature of the RTAS function to
user space, to prevent concurrent clients from interfering with each
other. That implies that the kernel should buffer the VPD results
internally; at least that's the only idea I've had so far. Open to
other suggestions.
