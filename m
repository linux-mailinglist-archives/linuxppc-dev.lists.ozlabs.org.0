Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF3149A7A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 05:02:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjY865NJvz3bSq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 15:01:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ndVUhvV8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ndVUhvV8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjY7M6t0Qz2xtF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 15:01:19 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20P3gUgY026770; 
 Tue, 25 Jan 2022 04:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=/bcrqEqxCAgYjJCo0QAZwIh5UE6WzRXNoRu3NuY6kMM=;
 b=ndVUhvV8/RP217hskHzMd2hwQ4XdlM78rss9es69KUdd0YxGE0O1Gf00LKvBwT9uFEBy
 Cghm8vXLqCtmHzFzMGKq7q4S0uGQULsIr4JQfeUiZt7SKLNVRa8PqPP1KQHP/gtiSRQv
 QIg7j1vi+yjHhVERUReqaSPDeAUDOehHqAjnxr9bZVwRd2xxfWzCIZgRNdva+mFSOoZo
 TgsxBTl3Rto7JhQ/Xna7wA/263GH+FmDm+g3VgSouS/dViGQ9B1ZGmoQkV34wKOeXwaf
 W/d3pEtdc5LnasDsX5cnW8rXbyJ9LBN5crXCNGu8cbf7gJl79g/OwQx/g73vGtMvST/i JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dt9ha08rp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 04:00:57 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20P3ubgN007289;
 Tue, 25 Jan 2022 04:00:57 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dt9ha08r7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 04:00:57 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20P3vkMd032087;
 Tue, 25 Jan 2022 04:00:55 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3dr9j98tep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 04:00:55 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20P40rgJ25231726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 04:00:53 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C946A4057;
 Tue, 25 Jan 2022 04:00:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F582A4040;
 Tue, 25 Jan 2022 04:00:52 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.195.34.207])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jan 2022 04:00:52 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [powerpc] ftrace warning kernel/trace/ftrace.c:2068 with
 code-patching selftests
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20220124114548.30241947@gandalf.local.home>
Date: Tue, 25 Jan 2022 09:30:51 +0530
Content-Transfer-Encoding: 7bit
Message-Id: <E92BCDD9-9631-4668-815E-8D443D2E21D9@linux.ibm.com>
References: <944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linux.ibm.com>
 <e9422643-a210-b77f-a037-da63a9d2e925@linux.alibaba.com>
 <20220124114548.30241947@gandalf.local.home>
To: Steven Rostedt <rostedt@goodmis.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MR_IAxf-ZoOv-1QCArJSDpP0Duyjc0KY
X-Proofpoint-GUID: ISyzG0gvzMoWUo6m_hE8FDTVpZ6Vshp1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_10,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 mlxscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201250020
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
Cc: Yinan Liu <yinan@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On 24-Jan-2022, at 10:15 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> On Mon, 24 Jan 2022 20:15:06 +0800
> Yinan Liu <yinan@linux.alibaba.com> wrote:
> 
>> Hi, Steven and Sachin
>> 
>> I don't have a powerpc machine for testing, I guess the ppc has a 
>> similar problem with the s390. It's not clear to me why the compiler 
>> does this. Maybe we can handle ppc like you did with the s390 before, 
>> but I'm not sure if other architectures have similar issues. Or limit 
>> BUILDTIME_MCOUNT_SORT to a smaller scope and make it only available for 
>> x86 and arm?
>> 
>> steven, what's your opinion?
> 
> Yeah, I think it's time to opt in, instead of opting out.
> 
> Something like this:
> 
Thanks. This fixes the reported problem.

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

- Sachin
