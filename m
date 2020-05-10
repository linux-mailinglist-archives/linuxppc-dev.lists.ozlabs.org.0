Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CD31CCB3C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 15:00:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Kkgf3PLhzDqx2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 23:00:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Kkcy2RJQzDqkR
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 May 2020 22:57:54 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04ACUjtJ061216; Sun, 10 May 2020 08:57:08 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30xe5sbhur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 10 May 2020 08:57:08 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04ACpD9g007705;
 Sun, 10 May 2020 12:57:06 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 30wm55afgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 10 May 2020 12:57:06 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 04ACv4sV63242508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 10 May 2020 12:57:04 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58368AE04D;
 Sun, 10 May 2020 12:57:04 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19C48AE051;
 Sun, 10 May 2020 12:57:01 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.199.51.177])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sun, 10 May 2020 12:57:00 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Sun, 10 May 2020 18:27:00 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Joe Perches <joe@perches.com>, Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v7 2/5] seq_buf: Export seq_buf_printf() to external
 modules
In-Reply-To: <ff1fcc5b32a9ad209660c7cfe7e212c1a16ba10d.camel@perches.com>
References: <20200508104922.72565-1-vaibhav@linux.ibm.com>
 <20200508104922.72565-3-vaibhav@linux.ibm.com>
 <20200508113100.GA19436@zn.tnic> <87blmy8wm8.fsf@linux.ibm.com>
 <ff1fcc5b32a9ad209660c7cfe7e212c1a16ba10d.camel@perches.com>
Date: Sun, 10 May 2020 18:27:00 +0530
Message-ID: <87y2q06j8j.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-10_04:2020-05-08,
 2020-05-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 phishscore=0 suspectscore=1 priorityscore=1501 mlxscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 impostorscore=0 mlxlogscore=786
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005100113
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Piotr Maziarz <piotrx.maziarz@linux.intel.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Joe,

Joe Perches <joe@perches.com> writes:

> On Fri, 2020-05-08 at 17:30 +0530, Vaibhav Jain wrote:
>> Hi Boris,
>> 
>> Borislav Petkov <bp@alien8.de> writes:
>> 
>> > On Fri, May 08, 2020 at 04:19:19PM +0530, Vaibhav Jain wrote:
>> > > 'seq_buf' provides a very useful abstraction for writing to a string
>> > > buffer without needing to worry about it over-flowing. However even
>> > > though the API has been stable for couple of years now its stills not
>> > > exported to external modules limiting its usage.
>> > > 
>> > > Hence this patch proposes update to 'seq_buf.c' to mark
>> > > seq_buf_printf() which is part of the seq_buf API to be exported to
>> > > external GPL modules. This symbol will be used in later parts of this
>> > 
>> > What is "external GPL modules"?
>> I am referring to Kernel Loadable Modules with MODULE_LICENSE("GPL")
>> here.
>
> Any reason why these Kernel Loadable Modules with MODULE_LICENSE("GPL")
> are not in the kernel tree?

The Kernel GPL module that this patch reffers to is 'papr_scm' which is already
in kernel tree at arch/powerpc/platforms/pseries/papr_scm.c . 

~ Vaibhav
