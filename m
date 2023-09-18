Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFDD7A4B03
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 16:18:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RaeyOei+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rq6MW6j4Tz3cCH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 00:17:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RaeyOei+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rq6Lg62zKz2ys9;
	Tue, 19 Sep 2023 00:17:15 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38IEAR3Y017046;
	Mon, 18 Sep 2023 14:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=2IN7a+8N9oPuZ9hHhuysXv+MWVPYYhLYB4NA9Q7qais=;
 b=RaeyOei+Djegi8Fdf0rgheyEDesg9W2M7W0ZRDlHF0BxrBFffeF53h2by4ynTSIUYWvb
 NvRJuLZpLRN1aBMLC7+0m3z97/0dsOhHToj7LIKBUco2wemip5aQNMQ+GIEkh+VgBXCt
 OF2/ot/Awyqddd3LDQV6t3KKAILk0owqB8ESbou2q0GgutDl2vuoLHV27YximfFlxRvf
 Yki1ZOf/XxCDqoFjFkQAZLAXLZE4IVDZerTYt2MDuAMW4e7Y3kweN0sv6kpnyH8NyMwC
 VcHTJMLWWX4eCZSQgnBJHo7sVm7hbJnRSY8texpAiH+8IDcqHVNxDHo37MjXw1AN/HqR Tw== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t6qkf8why-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 14:17:07 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38IDhxSk016432;
	Mon, 18 Sep 2023 14:12:41 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t5sd1jur0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 14:12:41 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38IECeMZ53608930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Sep 2023 14:12:41 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D1DD75805A;
	Mon, 18 Sep 2023 14:12:40 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6114B58054;
	Mon, 18 Sep 2023 14:12:40 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.61.94.45])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with SMTP;
	Mon, 18 Sep 2023 14:12:40 +0000 (GMT)
Received: from arbab-laptop.ghola.net (localhost [IPv6:::1])
	by arbab-laptop.localdomain (Postfix) with ESMTPS id EE824171B60;
	Mon, 18 Sep 2023 09:12:28 -0500 (CDT)
Date: Mon, 18 Sep 2023 09:12:27 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] core/device: Add function to return child node using
 name at substring "@"
Message-ID: <ca53fb3c-3ce7-463d-b59c-205e07aa5765@arbab-laptop>
References: <20230914163206.97811-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230914163206.97811-1-atrajeev@linux.vnet.ibm.com>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5iVfNGJSmJU47qsQiZ8YVEr2eD-MJ5G6
X-Proofpoint-ORIG-GUID: 5iVfNGJSmJU47qsQiZ8YVEr2eD-MJ5G6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_08,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=690
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309180123
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

On Thu, Sep 14, 2023 at 10:02:04PM +0530, Athira Rajeev wrote:
>Add a function dt_find_by_name_before_addr() that returns the child node if
>it matches till first occurrence at "@" of a given name, otherwise NULL.
>This is helpful for cases with node name like: "name@addr". In
>scenarios where nodes are added with "name@addr" format and if the
>value of "addr" is not known, that node can't be matched with node
>name or addr. Hence matching with substring as node name will return
>the expected result. Patch adds dt_find_by_name_before_addr() function
>and testcase for the same in core/test/run-device.c

Series applied to skiboot master with the fixup we discussed.

-- 
Reza Arbab
