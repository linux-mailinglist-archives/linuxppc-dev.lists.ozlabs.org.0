Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D68A80F14E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 16:39:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GCt1TX7T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqN8q536Xz3c4C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 02:39:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GCt1TX7T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqN7x2Zryz3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 02:39:08 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BCFb5K3027008;
	Tue, 12 Dec 2023 15:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=a9wK0cBefhda7UmrFVVczKTtJiDIZBqk+HUHCAnXH3o=;
 b=GCt1TX7T+hpk+FjWJHEDBrmTrEI8ZEtCvUStcKFBoU9Jv+4kukUVT3R61FWHafylNJj9
 l3a19Rdvtj/vxEwaePPOrr2xSlbxawulDSCvNSz47VGqcFqL0e88ZYN+IZw7QRzYEjGP
 Pjs2mhd+drZaRx/aCa1d1qs8ABfh0CNhl/cUC83Bz3BszAEf9S/VdX4MNUde3sCwsPXz
 3HZY+aPiYXS9JQ4x7rpCN9eaY1xmnEXlfSfiKMSNu/1/PT10NNhTIf5h8Ty9pvSfTS44
 Zj7uRGzVEo1IcWNhB1UAedtCRj1QWEvtbN4fMGa1Rdm0aZ6okorogNbXMvOwYG59N95S MA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uxtan01c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 15:38:53 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BCFbZdr030283;
	Tue, 12 Dec 2023 15:38:52 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uxtan01bg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 15:38:52 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BCCML2v014799;
	Tue, 12 Dec 2023 15:38:51 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uw42kct5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 15:38:51 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BCFcoX933554814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Dec 2023 15:38:50 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F260A5805E;
	Tue, 12 Dec 2023 15:38:49 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C9F1C58054;
	Tue, 12 Dec 2023 15:38:49 +0000 (GMT)
Received: from localhost (unknown [9.61.98.174])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Dec 2023 15:38:49 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 11/13] powerpc/pseries/papr-sysparm: Expose character
 device to user space
In-Reply-To: <20231207-papr-sys_rtas-vs-lockdown-v5-11-2ce965636a58@linux.ibm.com>
References: <20231207-papr-sys_rtas-vs-lockdown-v5-0-2ce965636a58@linux.ibm.com>
 <20231207-papr-sys_rtas-vs-lockdown-v5-11-2ce965636a58@linux.ibm.com>
Date: Tue, 12 Dec 2023 09:38:49 -0600
Message-ID: <87plzbjura.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VDPmeSjMuW75AmZXadFV2k5CQodVElLt
X-Proofpoint-ORIG-GUID: TaSJLiEaVx1TNm-3HHeyiPc6-1k3bcgv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-12_09,2023-12-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=736 lowpriorityscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312120120
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
Cc: "Aneesh Kumar K.V \(IBM\)" <aneesh.kumar@kernel.org>, tyreld@linux.ibm.com, Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
writes:
> +static long papr_sysparm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
> +{
> +	void __user *argp = (__force void __user *)arg;
> +	long ret;
> +
> +	switch (ioctl) {
> +	case PAPR_SYSPARM_IOC_GET:
> +		ret = papr_sysparm_ioctl_get(argp);
> +		break;
> +	case PAPR_SYSPARM_IOC_SET:
> +		ret = papr_sysparm_ioctl_set(argp);
> +		break;

Some offline discussion raised the point that updating system parameters
should be allowed only when the device is opened for writing. I've made
this change and added a testcase for v6, coming shortly.
