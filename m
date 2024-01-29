Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F8883FDCC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 06:44:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dRar5eJu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNch513Ncz3by2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 16:44:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dRar5eJu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNcgK4FMnz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jan 2024 16:44:13 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40T4TVNd000412;
	Mon, 29 Jan 2024 05:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=5P19J4UsCEy395Sq3OX4ZVElGZFdAvopFeOiSHWhQEY=;
 b=dRar5eJuhlhXw888NbvsP9CB2dVEj6Wg8i42MaDSFVk7trPXqFEUI25p6YQlJSnlaLmI
 1brq5tQlJP4KoA+ApTperTjQTWq1rzxDNIpqPg8Fi3HZpfrYvN4wylBMOgeqIcZSTcVW
 2GavLDrAxS69pxFnPcKx376+G7oPSb6MsyOz04VfIvzoZy+4KdGqhPmEK5TVf5hagiI9
 1bjyPT+U3yhJCMVxEd5vKTA0bXWaBlEbyyTik8qBRJHJrDYDsb6hQ4UfJNjQMwN/pvJo
 rwbOJOnME6SUBlIMo7/aNSx9J6k3RVclAhHve4XqYK9q8yu+zPhYDqGXO8rIHLCXV4yQ 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vwtaek4v7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 05:44:01 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40T4dcZS031374;
	Mon, 29 Jan 2024 05:44:00 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vwtaek4u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 05:44:00 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40T5R7UZ007964;
	Mon, 29 Jan 2024 05:43:59 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vwdnkp8s7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 05:43:59 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40T5hu6s46661986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Jan 2024 05:43:56 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F206C20043;
	Mon, 29 Jan 2024 05:43:55 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7753A20040;
	Mon, 29 Jan 2024 05:43:51 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.43.24.56])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 29 Jan 2024 05:43:51 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Mon, 29 Jan 2024 11:13:50 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Michael Ellerman
 <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe
 Leroy <christophe.leroy@csgroup.eu>,
        "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        Kautuk Consul <kconsul@linux.vnet.ibm.com>,
        Amit Machhiwal
 <amachhiw@linux.vnet.ibm.com>,
        Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV nestedv2: Fix an error handling
 path in gs_msg_ops_kvmhv_nestedv2_config_fill_info()
In-Reply-To: <a7ed4cc12e0a0bbd97fac44fe6c222d1c393ec95.1706441651.git.christophe.jaillet@wanadoo.fr>
References: <a7ed4cc12e0a0bbd97fac44fe6c222d1c393ec95.1706441651.git.christophe.jaillet@wanadoo.fr>
Date: Mon, 29 Jan 2024 11:13:50 +0530
Message-ID: <874jewy9rd.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kpf5wIbPQbNQS9J3hKoQo_0puOIwm1mu
X-Proofpoint-GUID: FRQApm0KkC0kJTi0jS-4tya3IfZLlrx8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_02,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 mlxlogscore=901 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401290039
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
Cc: kvm@vger.kernel.org, Gautam Menghani <gautam@linux.ibm.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>




Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:

<snip>
>  	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_RUN_OUTPUT)) {
> -		kvmppc_gse_put_buff_info(gsb, KVMPPC_GSID_RUN_OUTPUT,
> -					 cfg->vcpu_run_output_cfg);
> +		rc = kvmppc_gse_put_buff_info(gsb, KVMPPC_GSID_RUN_OUTPUT,
> +					      cfg->vcpu_run_output_cfg);
>  		if (rc < 0)
>  			return rc;
>  	}
> -- 
Thanks for catching this and the change looks good to me.

Reviewed-by: Vaibhav Jain <vaibhav@linux.ibm.com>

-- 
Cheers
~ Vaibhav
