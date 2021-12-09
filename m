Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C2B46EA91
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 16:04:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8y4b51Rpz3cQX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 02:04:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hJiW8MVU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8y3r39fBz2xCS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 02:04:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hJiW8MVU; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4J8y3r2vfgz4xhj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 02:04:08 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4J8y3r2pC2z4xhl; Fri, 10 Dec 2021 02:04:08 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hJiW8MVU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4J8y3r0VJLz4xhj
 for <linuxppc-dev@ozlabs.org>; Fri, 10 Dec 2021 02:04:07 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9EwELg024083
 for <linuxppc-dev@ozlabs.org>; Thu, 9 Dec 2021 15:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=z+d38ei3Z0RGsTjHrji+JMOHQiw7F0XMrPgmP7FoyL4=;
 b=hJiW8MVUOC9YUfq1OmWCqPSW1NdUKqUbe1EtOo60X3e5QCXGkZGqy2c+rJVBn3ftcXQj
 LHlxUjHKI+j+nI5bzL1FfO0NshBcNsJECBZ9e845onO3r02P8PcpFb32aKkori9R3N/7
 EWxKE47jcRA5IKLK1+WVBswd8yMbDTrvG9mooX0WU6w1uNE43JUNDXyfp/aYX7fMZtV7
 KENDgc3vnjOTw9LwSXGZ93C2v//HUP6BAmErzn53cmoEL8jZYBruAgqB37yRj/p/tK/T
 BBqZ5KKb+B1gihW3UwmKiJcnzc4m9WN5gJ4pLhfvVG5Kfbqkgae9gi8pWgljZuwBFdH9 ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cum1gg4cm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 09 Dec 2021 15:04:06 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B9EwmWc024930
 for <linuxppc-dev@ozlabs.org>; Thu, 9 Dec 2021 15:04:05 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cum1gg4c0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 15:04:05 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B9F1w3J023449;
 Thu, 9 Dec 2021 15:04:04 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 3cqyydhtna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 15:04:03 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B9F40Yb25756096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Dec 2021 15:04:00 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60AA22805E;
 Thu,  9 Dec 2021 15:04:00 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2FA028060;
 Thu,  9 Dec 2021 15:03:59 +0000 (GMT)
Received: from localhost (unknown [9.211.99.77])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  9 Dec 2021 15:03:59 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: mahesh@linux.ibm.com
Subject: Re: [PATCH] powerpc/rtas: Introduce rtas_get_sensor_nonblocking()
 for pci hotplug driver.
In-Reply-To: <20211203134230.iklzvh7fjd6wrzp2@in.ibm.com>
References: <163817631601.2016996.16085383012429651821.stgit@jupiter>
 <87o862nt0q.fsf@linux.ibm.com>
 <20211203134230.iklzvh7fjd6wrzp2@in.ibm.com>
Date: Thu, 09 Dec 2021 09:03:59 -0600
Message-ID: <87v8zxn7kw.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JvYXe0PetfGr6M5Qc9efs3Fu2eycPLBy
X-Proofpoint-GUID: nrK1JAXFjYkcrmV3hWXcpwPhBBVJ1r3m
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_06,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=567 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112090082
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mahesh J Salgaonkar <mahesh@linux.ibm.com> writes:
> On 2021-11-29 22:53:41 Mon, Nathan Lynch wrote:
>> Mahesh Salgaonkar <mahesh@linux.ibm.com> writes:
>> >
>> > However on certain PHB failures, the rtas call get-sesnor-state() returns
>> > extended busy error (9902) until PHB is recovered by phyp. Once PHB is
>> > recovered, the get-sensor-state() returns success with correct presence
>> > status. The rtas call interface rtas_get_sensor() loops over the rtas call
>> > on extended delay return code (9902) until the return value is either
>> > success (0) or error (-1). This causes the EEH handler to get stuck for ~6
>> > seconds before it could notify that the pci error has been detected and
>> > stop any active operations.
>> 
>> I am curious whether you see any difference with "powerpc/rtas:
>> rtas_busy_delay() improvements" which was recently applied. It will
>> cause the the calling task to sleep in response to a 990x status instead
>> of immediately retrying:
>> 
>> https://git.kernel.org/powerpc/c/38f7b7067dae0c101be573106018e8af22a90fdf
>> 
>> If that commit helps then maybe this change isn't needed.
>
> I tried with above commit but it didn't help.

OK, not too surprising, but thank you for checking.
