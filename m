Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAAA308F79
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 22:32:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DS9XQ0Y6DzDrj8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 08:32:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=E19mGMjF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DS9V52kp8zDrQg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 08:30:03 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10TLKQ2l167538; Fri, 29 Jan 2021 16:29:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=ZG/SONqMH36JuI71papBw9mGUgHN41poRpOJhmSspxY=;
 b=E19mGMjFRHQhXI9/QfhJ544SmB8WnJrj5o6p/rfyUS2OgzA3558CrfUgOE4mkybSJX6L
 94wS4IfbarkiKrSX5r+rHwkkMFHaRMA+NVqhfcJOrd9WITMr2pZHtY7aVp4qi+e5AD//
 4dt5xcDpqbeR4E0ZXJY2eIPIeHW6eNSMmS+GMcvKa/gtB/ty3EYnG+56xIqNWLIiFv5T
 HTS4xmqDQBRXoR5DledudOfiVHZPG+adNCdT1/aH8KtjHfYoilEf3L5ICsD5lbId8PGc
 sQ/BfGhXsijzQxtYOxpqMyUklUjh7CCiz/Rn5+63wORuKprO+/RszEWTA01aSXq5qnYV LA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36ct6p050x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 16:29:56 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10TLKmhp167910;
 Fri, 29 Jan 2021 16:29:55 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36ct6p04ye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 16:29:55 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10TLKstU030510;
 Fri, 29 Jan 2021 21:29:49 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 36a8uhw5tw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 21:29:49 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10TLTnS726477012
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 21:29:49 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BC36AC05E;
 Fri, 29 Jan 2021 21:29:49 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 003E5AC059;
 Fri, 29 Jan 2021 21:29:44 +0000 (GMT)
Received: from manicouagan.localdomain (unknown [9.85.189.105])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 29 Jan 2021 21:29:44 +0000 (GMT)
References: <20210128181421.2279-1-hch@lst.de>
 <20210128181421.2279-5-hch@lst.de>
 <874kj023bj.fsf@manicouagan.localdomain> <20210129051012.GA2053@lst.de>
User-agent: mu4e 1.4.10; emacs 27.1
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/13] module: use RCU to synchronize find_module
In-reply-to: <20210129051012.GA2053@lst.de>
Date: Fri, 29 Jan 2021 18:29:43 -0300
Message-ID: <871re31lfc.fsf@manicouagan.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-01-29_09:2021-01-29,
 2021-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290100
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
Cc: Petr Mladek <pmladek@suse.com>, Jiri Kosina <jikos@kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 live-patching@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 Joe Lawrence <joe.lawrence@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Jessica Yu <jeyu@kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miroslav Benes <mbenes@suse.cz>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Christoph Hellwig <hch@lst.de> writes:

> On Thu, Jan 28, 2021 at 05:50:56PM -0300, Thiago Jung Bauermann wrote:
>> >  struct module *find_module(const char *name)
>> >  {
>> > -	module_assert_mutex();
>> 
>> Does it make sense to replace the assert above with the warn below (untested)?
>> 
>>      RCU_LOCKDEP_WARN(rcu_read_lock_sched_held());
>
> One caller actually holds module_mutex still.  And find_module_all,
> which implements the actual logic already asserts that either
> module_mutex is held or rcu_read_lock, so I don't tink we need an
> extra one here.

Ok, thanks for the clarification.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
