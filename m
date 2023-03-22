Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0565D6C5800
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 21:45:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhgTP5nFNz3cf6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 07:45:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Anz5c8/n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Anz5c8/n;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhgSQ08czz3cHX;
	Thu, 23 Mar 2023 07:44:21 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32MJJ8E1004606;
	Wed, 22 Mar 2023 20:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=MG6YFkU3ECIGvt0scE88dPK4TiUzaChmpH/igd/7KLU=;
 b=Anz5c8/n1tJPk/x0sRMjYj+TsVgPgnhkPKPQ7U8ICauhADYL6huhaRFRF8baoJUt2VR6
 GgDxJgSw7eOyM+39L2+VrvXEiLQzd/EpfZX++0CB4HDPc6+vF3/snEG/KcOH+mqjTUVj
 oe3kfRKB8/Jhk2sOCn4GRcK+dYDdL2devJHJbZ2OX8qXqHPAdAFDy0ZJgg0y0labb7p5
 oUhQp5i8C5ECw+BmJTN3MElXdI3SFBxC8ticRXzIqwfEf6mXB92/l5/r0DZOpcL0gk0D
 WPjc6CnW+Q4IC5M0oRgITP5lZH2dOpURDpU4qNaAuv4VFc2yRKQM5XddR5QhoDUqheIi AQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pg6rdu9w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 20:44:13 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32MJpQpx000564;
	Wed, 22 Mar 2023 20:44:12 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3pd4x7rqe3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 20:44:12 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32MKiBil12059274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Mar 2023 20:44:11 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EF2958059;
	Wed, 22 Mar 2023 20:44:11 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE1C458055;
	Wed, 22 Mar 2023 20:44:10 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 22 Mar 2023 20:44:10 +0000 (GMT)
Received: from arbab-laptop.austin.ibm.com (localhost [IPv6:::1])
	by arbab-laptop.localdomain (Postfix) with ESMTPS id 291951756DF;
	Wed, 22 Mar 2023 15:44:10 -0500 (CDT)
Date: Wed, 22 Mar 2023 15:44:09 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [Skiboot] [PATCH V4 3/3] skiboot: Update IMC PMU node names for
 power10
Message-ID: <ZBtomRWcK4ni49df@arbab-laptop.austin.ibm.com>
References: <20230306033913.80524-1-atrajeev@linux.vnet.ibm.com>
 <20230306033913.80524-3-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230306033913.80524-3-atrajeev@linux.vnet.ibm.com>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ov5jO7tKzdhDjRwVsATgUIktTrcGleH1
X-Proofpoint-ORIG-GUID: Ov5jO7tKzdhDjRwVsATgUIktTrcGleH1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_17,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220145
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
Cc: maddy@linux.ibm.com, dan@danny.cz, kjain@linux.ibm.com, skiboot@lists.ozlabs.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 06, 2023 at 09:09:13AM +0530, Athira Rajeev wrote:
>+	} else if (proc_gen == proc_gen_p10) {
>+		int val;
>+		char al[8], xl[8], otl[8], phb[8];

Are four different variables needed here? I think you could just reuse 
one temporary variable.

		char name[8];

>+		for (i=0; i<8; i++) {
>+			val = ((avl_vec & (0x7ULL << (29 + (3 * i)))) >> (29 + (3 * i)));
>+			switch (val) {
>+			case 0x5: //xlink configured and functional
>+
>+				snprintf(al, sizeof(al), "alink%1d",(7-i));
>+				target = dt_find_by_name_substr(dev, al);
>+				if (target)
>+					dt_free(target);
>+
>+				snprintf(otl, sizeof(otl),"otl%1d_0",(7-i));
>+				target = dt_find_by_name_substr(dev, otl);
>+				if (target)
>+					dt_free(target);
>+
>+				snprintf(otl,sizeof(otl),"otl%1d_1",(7-i));
>+				target = dt_find_by_name_substr(dev, otl);
>+				if (target)
>+					dt_free(target);
>+
>+				break;
>+			case 0x6: //alink configured and functional
>+
>+				snprintf(xl,sizeof(xl),"xlink%1d",(7-i));
>+				target = dt_find_by_name_substr(dev, xl);
>+				if (target)
>+					dt_free(target);
>+
>+				snprintf(otl,sizeof(otl),"otl%1d_0",(7-i));
>+				target = dt_find_by_name_substr(dev, otl);
>+				if (target)
>+					dt_free(target);
>+
>+				snprintf(otl,sizeof(otl),"otl%1d_1",(7-i));
>+				target = dt_find_by_name_substr(dev, otl);
>+				if (target)
>+					dt_free(target);
>+				break;
>+
>+			case 0x7: //CAPI configured and functional
>+				snprintf(al,sizeof(al),"alink%1d",(7-i));
>+				target = dt_find_by_name_substr(dev, al);
>+				if (target)
>+					dt_free(target);
>+
>+				snprintf(xl,sizeof(xl),"xlink%1d",(7-i));
>+				target = dt_find_by_name_substr(dev, xl);
>+				if (target)
>+					dt_free(target);
>+				break;
>+			default:
>+				snprintf(xl,sizeof(xl),"xlink%1d",(7-i));
>+				target = dt_find_by_name_substr(dev, xl);
>+				if (target)
>+					dt_free(target);
>+
>+				snprintf(al,sizeof(al),"alink%1d",(7-i));
>+				target = dt_find_by_name_substr(dev, al);
>+				if (target)
>+					dt_free(target);
>+
>+				snprintf(otl,sizeof(otl),"otl%1d_0",(7-i));
>+				target = dt_find_by_name_substr(dev, otl);
>+				if (target)
>+					dt_free(target);
>+
>+				snprintf(otl,sizeof(otl),"otl%1d_1",(7-i));
>+				target = dt_find_by_name_substr(dev, otl);
>+				if (target)
>+					dt_free(target);
>+				break;

As far as I know skiboot follows the kernel coding style. Would you mind 
fixing up the minor style nits checkpatch.pl reports for this patch?

-- 
Reza Arbab
