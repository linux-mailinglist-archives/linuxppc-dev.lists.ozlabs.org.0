Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A71776B54
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 23:59:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SuT7eXGI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLkV639fpz3cPm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 07:59:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SuT7eXGI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLkTD52Xgz30fj;
	Thu, 10 Aug 2023 07:58:24 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 379LovjC031558;
	Wed, 9 Aug 2023 21:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=WLCVTKM9mYAWvshQqnlMNGIoZPo9W1uNnFxvVHeqYMk=;
 b=SuT7eXGIlpaVsbaH7lD1ATMzmXAYC3A93Wer52JByPoizgMeH7h/4Lln+1NQCIEm1g4C
 rkeaQnUXBdvyAWYSGma8iD9VQmapzVTx7nK6lrBjzhhSNOfJflFcJikdNOAdTnIknbCC
 1dGko+k1zaiZ885Vc0NhdJjgK5WkPr517H4xxvWxxUU07At8tOWkJZgrDGV9XD+fygv7
 zjKWaiLyb5LTvdK6bbyd0OpTTyjg4a97Ol9GNtqBUUJPzfpKwZeNMULk5bh5NBBJewPo
 MNBnvlFJ7YFwFL2X5OJFP3QNhOgJpeTWjcPmpenBmd2cPC34R2iG6/tBzmWvUtNRZ2MJ Qg== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sck2m0409-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Aug 2023 21:58:16 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 379KILF3015354;
	Wed, 9 Aug 2023 21:58:16 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sb3f35m7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Aug 2023 21:58:16 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 379LwFbP57737644
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Aug 2023 21:58:15 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7BBD25805C;
	Wed,  9 Aug 2023 21:58:15 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6664C5805B;
	Wed,  9 Aug 2023 21:58:15 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  9 Aug 2023 21:58:15 +0000 (GMT)
Received: from arbab-laptop.austin.ibm.com (localhost [IPv6:::1])
	by arbab-laptop.localdomain (Postfix) with ESMTPS id 99D03B1075D;
	Wed,  9 Aug 2023 16:58:14 -0500 (CDT)
Date: Wed, 9 Aug 2023 16:58:13 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V5 3/3] skiboot: Update IMC PMU node names for power10
Message-ID: <f45ca55e-7d63-451a-9763-d3a6b8196179@arbab-laptop>
References: <20230717032431.33778-1-atrajeev@linux.vnet.ibm.com>
 <20230717032431.33778-3-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230717032431.33778-3-atrajeev@linux.vnet.ibm.com>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Drmo1wNBdBr4PR1t3U_mBY6Qzj4WRejY
X-Proofpoint-GUID: Drmo1wNBdBr4PR1t3U_mBY6Qzj4WRejY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-09_19,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 bulkscore=0 mlxlogscore=784 mlxscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308090188
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
Cc: maddy@linux.ibm.com, dan@danny.cz, mahesh@linux.ibm.com, kjain@linux.ibm.com, skiboot@lists.ozlabs.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 17, 2023 at 08:54:31AM +0530, Athira Rajeev wrote:
>@@ -408,14 +469,129 @@ static void disable_unavailable_units(struct dt_node *dev)
> 			avl_vec = (0xffULL) << 56;
> 	}
>
>-	for (i = 0; i < ARRAY_SIZE(nest_pmus); i++) {
>-		if (!(PPC_BITMASK(i, i) & avl_vec)) {
>-			/* Check if the device node exists */
>-			target = dt_find_by_name_before_addr(dev, nest_pmus[i]);
>-			if (!target)
>-				continue;
>-			/* Remove the device node */
>-			dt_free(target);
>+	if (proc_gen == proc_gen_p9) {
>+		for (i = 0; i < ARRAY_SIZE(nest_pmus_p9); i++) {
>+			if (!(PPC_BITMASK(i, i) & avl_vec)) {

I think all these PPC_BITMASK(i, i) can be changed to PPC_BIT(i).

>+				/* Check if the device node exists */
>+				target = dt_find_by_name_before_addr(dev, nest_pmus_p9[i]);
>+				if (!target)
>+					continue;
>+				/* Remove the device node */
>+				dt_free(target);
>+			}
>+		}
>+	} else if (proc_gen == proc_gen_p10) {
>+		int val;
>+		char name[8];
>+
>+		for (i = 0; i < 11; i++) {
>+			if (!(PPC_BITMASK(i, i) & avl_vec)) {
>+				/* Check if the device node exists */
>+				target = dt_find_by_name_before_addr(dev, nest_pmus_p10[i]);
>+				if (!target)
>+					continue;
>+				/* Remove the device node */
>+				dt_free(target);
>+			}
>+		}
>+
>+		for (i = 35; i < 41; i++) {
>+			if (!(PPC_BITMASK(i, i) & avl_vec)) {
>+				/* Check if the device node exists for phb */
>+				for (j = 0; j < 3; j++) {
>+					snprintf(name, sizeof(name), "phb%d_%d", (i-35), j);
>+					target = dt_find_by_name_before_addr(dev, name);
>+					if (!target)
>+						continue;
>+					/* Remove the device node */
>+					dt_free(target);
>+				}
>+			}
>+		}
>+
>+		for (i = 41; i < 58; i++) {
>+			if (!(PPC_BITMASK(i, i) & avl_vec)) {
>+				/* Check if the device node exists */
>+				target = dt_find_by_name_before_addr(dev, nest_pmus_p10[i]);
>+				if (!target)
>+					continue;
>+				/* Remove the device node */
>+				dt_free(target);
>+			}
>+		}

-- 
Reza Arbab
