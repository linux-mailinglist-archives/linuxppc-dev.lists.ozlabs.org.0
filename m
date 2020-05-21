Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5911DD488
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 19:35:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ScGc58JwzDqBm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 03:35:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SbXs5qc8zDqlg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 03:03:09 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04LH1Yrf067114; Thu, 21 May 2020 13:02:59 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 315pfwx1q7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 May 2020 13:02:59 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04LH2DoU070482;
 Thu, 21 May 2020 13:02:58 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 315pfwx1pc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 May 2020 13:02:58 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04LGtPjL030849;
 Thu, 21 May 2020 17:02:56 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 313xcd2fp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 May 2020 17:02:56 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 04LH2skX62652694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 May 2020 17:02:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 755F442045;
 Thu, 21 May 2020 17:02:54 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8708342042;
 Thu, 21 May 2020 17:02:52 +0000 (GMT)
Received: from [9.199.32.137] (unknown [9.199.32.137])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 May 2020 17:02:52 +0000 (GMT)
Subject: Re: [PATCH v2 3/5] libnvdimm/nvdimm/flush: Allow architecture to
 override the flush barrier
To: Jeff Moyer <jmoyer@redhat.com>, Dan Williams <dan.j.williams@intel.com>
References: <20200513034705.172983-1-aneesh.kumar@linux.ibm.com>
 <20200513034705.172983-3-aneesh.kumar@linux.ibm.com>
 <CAPcyv4iAdrdMiSzVr1UL9Naya+Rq70WVuKqCCNFHe1C4n+E6Tw@mail.gmail.com>
 <87v9kspk3x.fsf@linux.ibm.com>
 <CAPcyv4g+oE305Q5bYWkNBKFifB9c0TZo6+hqFQnqiFqU5QFrhQ@mail.gmail.com>
 <87d070f2vs.fsf@linux.ibm.com>
 <CAPcyv4jZhYXEmYGzqGPjPtq9ZWJNtQyszN0V0Xcv0qtByK_KCw@mail.gmail.com>
 <x49o8qh9wu5.fsf@segfault.boston.devel.redhat.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <ba91c061-41ef-5c54-8e9b-7b22e44577cd@linux.ibm.com>
Date: Thu, 21 May 2020 22:32:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <x49o8qh9wu5.fsf@segfault.boston.devel.redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-21_10:2020-05-21,
 2020-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 impostorscore=0 cotscore=-2147483648
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005210118
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
Cc: Jan Kara <jack@suse.cz>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 mpatocka@redhat.com, alistair@popple.id.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/21/20 8:08 PM, Jeff Moyer wrote:
> Dan Williams <dan.j.williams@intel.com> writes:
> 
>>> But I agree with your concern that if we have older kernel/applications
>>> that continue to use `dcbf` on future hardware we will end up
>>> having issues w.r.t powerfail consistency. The plan is what you outlined
>>> above as tighter ecosystem control. Considering we don't have a pmem
>>> device generally available, we get both kernel and userspace upgraded
>>> to use these new instructions before such a device is made available.
> 
> I thought power already supported NVDIMM-N, no?  So are you saying that
> those devices will continue to work with the existing flushing and
> fencing mechanisms?
> 

yes. these devices can continue to use 'dcbf + hwsync' as long as we are 
running them on P9.


>> Ok, I think a compile time kernel option with a runtime override
>> satisfies my concern. Does that work for you?
> 
> The compile time option only helps when running newer kernels.  I'm not
> sure how you would even begin to audit userspace applications (keep in
> mind, not every application is open source, and not every application
> uses pmdk).  I also question the merits of forcing the administrator to
> make the determination of whether all applications on the system will
> work properly.  Really, you have to rely on the vendor to tell you the
> platform is supported, and at that point, why put further hurdles in the
> way?
> 
> The decision to require different instructions on ppc is unfortunate,
> but one I'm sure we have no control over.  I don't see any merit in the
> kernel disallowing MAP_SYNC access on these platforms.  Ideally, we'd
> have some way of ensuring older kernels don't work with these new
> platforms, but I don't think that's possible.
> 


I am currently looking at the possibility of firmware present these 
devices with different device-tree compat values. So that older 
/existing kernel won't initialize the device on newer systems. Is that a 
good compromise? We still can end up with older userspace and newer 
kernel. One of the option suggested by Jan Kara is to use a prctl flag 
to control that? (intead of kernel parameter option I posted before)


> Moving on to the patch itself--Aneesh, have you audited other persistent
> memory users in the kernel?  For example, drivers/md/dm-writecache.c does
> this:
> 
> static void writecache_commit_flushed(struct dm_writecache *wc, bool wait_for_ios)
> {
>   	if (WC_MODE_PMEM(wc))
> 	        wmb(); <==========
>          else
>                  ssd_commit_flushed(wc, wait_for_ios);
> }
> 
> I believe you'll need to make modifications there.
> 

Correct. Thanks for catching that.


I don't understand dm much, wondering how this will work with 
non-synchronous DAX device?

-aneesh
