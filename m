Return-Path: <linuxppc-dev+bounces-2537-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B02A9ADB3E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 07:12:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYvDs1tsYz2yNn;
	Thu, 24 Oct 2024 16:12:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729746765;
	cv=none; b=YQPu4W63XyaOszjxsHp9rxxFM9fd7fK06B8gaxRwEkc4LFYQcs/bPnvu7mg6m9pURLLORh0rVj4+h5nupxLDUANlPn79Z/1CE+ful3aVL0T6nHFy3dUQLQTGu+JRaz65C6Siq33PBPmgliXu80e38YrkiTuC4irZdot+v+k/ZCrXLHs00iBjyFIT4+gHyi8+B/3TCjcDOZWWFDVO8MGkmPaxLWo86CWXc9FLV/whI3X5LbQI+9tM5+iuBEKEwNwLfdgI9wsOQftFgk/HkmKtFG4fTlMhB4k7JJike6Imt/aVnK4yLoPP8MrlQ0mWXBX2Ip0IT2kslOjFz93Tlw4JEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729746765; c=relaxed/relaxed;
	bh=TXFrdIm5p9Wa64yKLDT0F/rOY1g3HYH3e1sYJFUmAdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KY49dy3xv5BoNdJL/l9mpBA/YzptLL7OVkvkquPVFmd69sCaqrK5eqT+I1nXu1kJCVppErZ9Fu1lcHoTDaTOuTFgF0FOPpiN8DWOyRLjszM6ujSuLKc9vFn9pGbe8aS9H9Jb1F/Mbudx9qUIzCHquj2g2Z4qxG8lJcJW1mw9Vyrj2iF8JyPR+aF6Jchhm4+VgwE76f6LaAZSpCMYCsr1wcu+kdGzlLW4p94FUxW8Yvl7C2PpkNjnIas7BdYD7S9StNtzmOeE8VF3z49eIVSXUSLui6ByrldbKyjfakW2VL/SJiRGfqbePqtlj6wHy7+3clpzpRLBtVmJblRriMq9Og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JXdMcrVX; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JXdMcrVX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYvDq4Sbzz2yNJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 16:12:43 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O0dowS011407;
	Thu, 24 Oct 2024 05:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=TXFrdIm5p9Wa64yKLDT0F/rOY1g3HY
	H3e1sYJFUmAdM=; b=JXdMcrVXFhZDRxOcZMJTimxjatGyOBHlC2IZdccze1GpLe
	q5+cawG8r0oEVkTiUJgf9hPCFB5LgT/L1XdwNJEYm127C3O5wbVPLqbhwkd6zT6n
	UE9LUeDJt9Ki4ILfDX5/viaJvvZsHySnzkL3mZ8ker/Q4sZpUAiFN6Sz/ClF4rF8
	Hk5mbiJoE9ujzappVUgtgKO6R+aRMAPQBaxlLrMAZQKKuCNrywBhuTnb32tbYOlT
	weq4a3DwnASDr3e0kx4UZTqhdo14O+eMLtyLa0UX42DOFvQ5T4rFas0VCjC/DgIN
	3zZG/dbmaZBKGwp/kqOtc9TpQnq9bk6CuHFq4aWQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42fbw40srm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 05:12:24 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49O5CNXi027273;
	Thu, 24 Oct 2024 05:12:23 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42fbw40srh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 05:12:23 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49O2x3AI001557;
	Thu, 24 Oct 2024 05:12:22 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 42emk9ep1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 05:12:22 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49O5CJpg53215552
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 05:12:19 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 373C42004B;
	Thu, 24 Oct 2024 05:12:19 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D9EE2004D;
	Thu, 24 Oct 2024 05:12:17 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com (unknown [9.109.206.223])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 24 Oct 2024 05:12:17 +0000 (GMT)
Date: Thu, 24 Oct 2024 10:42:12 +0530
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
        maddy@linux.ibm.com, peterx@redhat.com, groug@kaod.org,
        sshegde@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/xmon: symbol lookup length fixed
Message-ID: <nxdkjwqtd7s3fcxebwod6lrfu7rngrj7fa4kk433hgypha66w5@6ahbuz7o2qmu>
References: <20241023212225.1306609-2-mchauras@linux.ibm.com>
 <878que2u2i.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878que2u2i.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: S4k4vbJKJ1uQiIHCG4BnOcFlWjM9nE9x
X-Proofpoint-GUID: orM-ET8bwJOf1MPkLNUECZ6RZVGrJ22t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 malwarescore=0
 mlxlogscore=931 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240034
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 24, 2024 at 12:00:53PM +1100, Michael Ellerman wrote:
> Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com> writes:
> > Currently xmon cannot lookup symbol beyond 64 characters in some cases.
> 
> Can you mention which commands? It looks like it's "ls" and "lp".
Sure.
> 
> > Fix this by using KSYM_NAME_LEN instead of fixed 64 characters.
> >
> > Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > ---
> >  arch/powerpc/xmon/xmon.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index e6cddbb2305f..22b8b5cc4df0 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -3662,7 +3662,7 @@ symbol_lookup(void)
> >  	int type = inchar();
> >  	unsigned long addr, cpu;
> >  	void __percpu *ptr = NULL;
> > -	static char tmp[64];
> > +	static char tmp[KSYM_NAME_LEN];
>   
> I think you could use the existing tmpstr buffer.
> 
> It is global so it's a little hard to track down all the users, but I
> think it's only used briefly in get_function_bounds(),
> xmon_print_symbol() and scanhex(). ie. none of the uses persist across
> function calls.
> 
> We don't want to have two 512 byte static arrays lying around if we can
> get by with one.
> 
> cheers
Sure.

Will send out V2.
> >  	switch (type) {
> >  	case 'a':
> > @@ -3671,7 +3671,7 @@ symbol_lookup(void)
> >  		termch = 0;
> >  		break;
> >  	case 's':
> > -		getstring(tmp, 64);
> > +		getstring(tmp, KSYM_NAME_LEN);
> >  		if (setjmp(bus_error_jmp) == 0) {
> >  			catch_memory_errors = 1;
> >  			sync();
> > @@ -3686,7 +3686,7 @@ symbol_lookup(void)
> >  		termch = 0;
> >  		break;
> >  	case 'p':
> > -		getstring(tmp, 64);
> > +		getstring(tmp, KSYM_NAME_LEN);
> >  		if (setjmp(bus_error_jmp) == 0) {
> >  			catch_memory_errors = 1;
> >  			sync();
> > -- 
> > 2.47.0

