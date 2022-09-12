Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F5E5B5675
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 10:40:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR0Qx4M1Kz3f3T
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 18:40:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qcPS81Iu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qcPS81Iu;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR0Pc0vV9z3bgC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 18:38:59 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C8Kw1a010931;
	Mon, 12 Sep 2022 08:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=BbzG5ffBvyLrq2RSMxzf8MFflv7l1/nnLqP6vWC/TQ8=;
 b=qcPS81Ius32mGNgK5Ag91u1upqP2uZ9B1mvdLrz+OjyCQRl0WlIbxznTC+G4atXV9qnE
 64sXoyW9V1+uc2HZmUk5jZ54xIbxRwIvCiMnyfBVPWVrRgF/BiEb3llFd7gzMcqeYTTR
 DICAIxzukWty6Cm9pu9zfIDhT/r+mzXLbX4ZGcs8eJM5LYJycXgzfIWrX+8sHzw+U+iX
 sctHQfG/IMxZH8ggw7Xyi+aZv9e7Pk//JIxZ4M7umzK0qHRsH5jlFkB76ODguuK9VOrh
 ZqGAEiKYX7hzDXwCclVVJ1+IHK6Wrfr+76xa6qk0Lh/668hFFyUx1bx7AlXDh/yUSIft JQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jj16a0f8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:38:55 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28C8b80D021766;
	Mon, 12 Sep 2022 08:38:53 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04fra.de.ibm.com with ESMTP id 3jgj78sj8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:38:53 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28C8dF9c20382204
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Sep 2022 08:39:15 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DC0AAE051;
	Mon, 12 Sep 2022 08:38:51 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD8DBAE04D;
	Mon, 12 Sep 2022 08:38:50 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 12 Sep 2022 08:38:50 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.177.18.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0305A600E5;
	Mon, 12 Sep 2022 18:38:43 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 2/3] powerpc: mm: add p{te,md,ud}_user_accessible_page
 helpers
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <91881012-0d3c-c072-2d07-6513b00e7bca@csgroup.eu>
Date: Mon, 12 Sep 2022 18:38:38 +1000
Content-Transfer-Encoding: 7bit
Message-Id: <A9C8A030-99B1-4250-A0EB-17859E80F1E3@linux.ibm.com>
References: <20220912014703.185471-1-rmclure@linux.ibm.com>
 <20220912014703.185471-2-rmclure@linux.ibm.com>
 <91881012-0d3c-c072-2d07-6513b00e7bca@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: x2RVioHnUqlotgRxmYGatt9vmxUXeZK4
X-Proofpoint-ORIG-GUID: x2RVioHnUqlotgRxmYGatt9vmxUXeZK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_04,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=900 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209120028
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>> +static inline bool pmd_user_accessible_page(pmd_t pmd)
>> +{
>> +	return pmd_is_leaf(pmd) && pmd_present(pmd)
>> +				&& pte_user(pmd_pte(pmd));
> 
> The && goes on previous line.

> By the way, there is a great tool that can help you :
> 
> $ ./arch/powerpc/tools/checkpatch.sh --strict -g HEAD~

Thank you. Yes I should be using --strict with checkpatch.

> 
>> +}
>> +
>> +#else
>> +
>> +static inline bool pmd_user_accessible_page(pmd_t pmd)
>> +{
>> +	BUG();
> 
> Can you use BUILD_BUG() instead ?

As it stands, p{m,u}d_user_accessible page is invoked by 
__page_table_check_p{m,u}d_{set,clear}. So unfortunately this
function will have to be compiled, but its body could be replaced
with a WARN() and return false on 32-bit.
