Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9F7117D54
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 02:44:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47X2t459Q8zDqVr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 12:44:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47X2r85bw0zDqN7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 12:42:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47X2r75tw7z8svl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 12:42:47 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47X2r74S57z9sR0; Tue, 10 Dec 2019 12:42:47 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47X2r670qLz9sPh
 for <linuxppc-dev@ozlabs.org>; Tue, 10 Dec 2019 12:42:45 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBA1g8jV031463
 for <linuxppc-dev@ozlabs.org>; Mon, 9 Dec 2019 20:42:43 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wskq788m9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 09 Dec 2019 20:42:43 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Tue, 10 Dec 2019 01:42:41 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Dec 2019 01:42:38 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBA1gbPr54394894
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Dec 2019 01:42:37 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19DDA11C04A;
 Tue, 10 Dec 2019 01:42:37 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6145311C052;
 Tue, 10 Dec 2019 01:42:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.59.157])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Dec 2019 01:42:35 +0000 (GMT)
Subject: Re: [PATCH v5 3/6] powerpc/fadump: reorganize /sys/kernel/fadump_*
 sysfs files
To: Greg KH <gregkh@linuxfoundation.org>
References: <20191209045826.30076-1-sourabhjain@linux.ibm.com>
 <20191209045826.30076-4-sourabhjain@linux.ibm.com>
 <20191209081023.GC706232@kroah.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
Date: Tue, 10 Dec 2019 07:12:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191209081023.GC706232@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19121001-0012-0000-0000-00000373505B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121001-0013-0000-0000-000021AF20DB
Message-Id: <64537bac-5fc3-bda8-4cac-338436b30d3e@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-09_05:2019-12-09,2019-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912100014
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
Cc: linux-doc@vger.kernel.org, mahesh@linux.vnet.ibm.com, corbet@lwn.net,
 linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/9/19 1:40 PM, Greg KH wrote:
> On Mon, Dec 09, 2019 at 10:28:23AM +0530, Sourabh Jain wrote:
>> +#define CREATE_SYMLINK(target, symlink_name) do {\
>> +	rc = compat_only_sysfs_link_entry_to_kobj(kernel_kobj, fadump_kobj, \
>> +						  target, symlink_name); \
>> +	if (rc) \
>> +		pr_err("unable to create %s symlink (%d)", symlink_name, rc); \
>> +} while (0)
> 
> 
> No need for a macro, just spell it all out.  And properly clean up if an
> error happens, you are just printing it out and moving on, which is
> probably NOT what you want to do, right?

Yeah actually there is no point in keeping the fadump_enabled symlink if fadump_registered
symlink creation fails.

And it is even better to unregister the FADump if fadump_group creation fails.

> 
>> +static struct attribute_group fadump_group = {
>> +	.attrs = fadump_attrs,
>> +};
> 
> ATTRIBUTE_GROUPS()?

Thanks, I will use this macro.

-Sourabh Jain



