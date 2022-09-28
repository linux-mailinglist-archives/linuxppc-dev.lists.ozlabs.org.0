Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA355EE6A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 22:35:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Md7YR3wgHz3c8d
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 06:35:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i+P/wXEo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i+P/wXEo;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Md7Xk6x4Tz2yxF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 06:35:18 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SJL73X000850;
	Wed, 28 Sep 2022 20:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : subject :
 in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Dz8fVpbz0v3FQzvUW6iFf2WOFBdT5o3RcfaXt4aWTTw=;
 b=i+P/wXEofp8xsIMQdrYGhfFk1Wx/K9IT15n/d0mlVzb+KAQ/yF2657dvWQTEhmkJEbNQ
 X/2mtGotdukZ0+q0r60IzUINca8tt5yIpjbRKNvxAGzR7YItI9DYn6xYfwOqBPDzg01j
 x4U9KBwtHvP9Vs9+YjkUyuRM0QHsitvmbhaQEZrZ69L/qGWkbg8RunSC5XXjn8jwP70E
 VhoHeeiZ50ZYTsDhuD9RcEaB7SnnOzphXOrjmkdJFY/Xt/FthtFagT9Ugb358GBQKsHE
 roi1rkV0rjPLX/mQc/T+P28tiudp3yW6RwF5588ETmepuRnjtkB6HLjMWC4wPu+j5MTr xA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvrcxark2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 20:35:11 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28SKKa9r017034;
	Wed, 28 Sep 2022 20:35:11 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma02wdc.us.ibm.com with ESMTP id 3jssh9ncjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 20:35:11 +0000
Received: from smtpav04.dal12v.mail.ibm.com ([9.208.128.131])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28SKZ83B41878230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Sep 2022 20:35:09 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D96AF58056;
	Wed, 28 Sep 2022 20:35:09 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7E965804E;
	Wed, 28 Sep 2022 20:35:09 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Sep 2022 20:35:09 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/6] powerpc: Add ppc_md.name to dump stack arch
 description
In-Reply-To: <20220928134025.1739909-1-mpe@ellerman.id.au>
References: <20220928134025.1739909-1-mpe@ellerman.id.au>
Date: Wed, 28 Sep 2022 15:35:09 -0500
Message-ID: <87r0zvp79e.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KPR_VCxDOX6rd_BdJLShBJkszhJJ0xM1
X-Proofpoint-ORIG-GUID: KPR_VCxDOX6rd_BdJLShBJkszhJJ0xM1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_09,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 priorityscore=1501 mlxlogscore=901 lowpriorityscore=0 phishscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280121
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> @@ -588,6 +590,15 @@ static __init int add_pcspkr(void)
>  device_initcall(add_pcspkr);
>  #endif	/* CONFIG_PCSPKR_PLATFORM */
>  
> +static char ppc_hw_desc_buf[128] __initdata;
> +
> +struct seq_buf ppc_hw_desc __initdata = {
> +	.buffer = ppc_hw_desc_buf,
> +	.size = sizeof(ppc_hw_desc_buf),
> +	.len = 0,
> +	.readpos = 0,
> +};
> +
>  static __init void probe_machine(void)
>  {
>  	extern struct machdep_calls __machine_desc_start;
> @@ -628,6 +639,9 @@ static __init void probe_machine(void)
>  		for (;;);
>  	}
>  
> +	seq_buf_printf(&ppc_hw_desc,"machine:%s ", ppc_md.name);
> +	dump_stack_set_arch_desc(ppc_hw_desc.buffer);

At first I was confused by the seemingly unnecessary use of the seq_buf,
but after reading the rest of the series I see that this is the final
addition to a temporary buffer before setting the arch description
string. Looks OK to me.
