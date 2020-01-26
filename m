Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C518A149A77
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jan 2020 12:47:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 485B1X5LsxzDqMh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jan 2020 22:46:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4859z42gQbzDqJV
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jan 2020 22:44:47 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00QBhfZr063676; Sun, 26 Jan 2020 06:44:41 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xrjr3407w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jan 2020 06:44:41 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 00QBiex0065187;
 Sun, 26 Jan 2020 06:44:40 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xrjr3407h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jan 2020 06:44:40 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00QBeBo0001998;
 Sun, 26 Jan 2020 11:44:39 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 2xrda5uyng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jan 2020 11:44:39 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00QBid1653412148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 26 Jan 2020 11:44:39 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13BB928059;
 Sun, 26 Jan 2020 11:44:39 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C19728058;
 Sun, 26 Jan 2020 11:44:36 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.53.28])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Sun, 26 Jan 2020 11:44:35 +0000 (GMT)
X-Mailer: emacs 27.0.60 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>, Jeff Moyer <jmoyer@redhat.com>
Subject: Re: [PATCH v4 1/6] libnvdimm/namespace: Make namespace size
 validation arch dependent
In-Reply-To: <CAPcyv4jPBfhC4t5+e2gxhzKfaLdQi_qTKfLEcXdo-MjTA5a+aw@mail.gmail.com>
References: <20200120140749.69549-1-aneesh.kumar@linux.ibm.com>
 <20200120140749.69549-2-aneesh.kumar@linux.ibm.com>
 <CAPcyv4jcZhQcKr=0OGWc1aZb0OQ1ws2edd-LZMR-EJ_Z2174Sg@mail.gmail.com>
 <5fd11235-5f26-b10a-140f-ef24214c85b1@linux.ibm.com>
 <CAPcyv4jP3S0h9vUVVU16ipeauXyaW3qxUdridagA4SNJ1UW+Vw@mail.gmail.com>
 <cb71528e-0ea9-cb56-6b51-ae7a5231ad54@linux.ibm.com>
 <CAPcyv4jPBfhC4t5+e2gxhzKfaLdQi_qTKfLEcXdo-MjTA5a+aw@mail.gmail.com>
Date: Sun, 26 Jan 2020 17:11:02 +0530
Message-ID: <871rrmqwc1.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-25_09:2020-01-24,
 2020-01-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001260103
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Williams <dan.j.williams@intel.com> writes:

> On Fri, Jan 24, 2020 at 9:07 AM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> On 1/24/20 10:15 PM, Dan Williams wrote:
>> > On Thu, Jan 23, 2020 at 11:34 PM Aneesh Kumar K.V
>> > <aneesh.kumar@linux.ibm.com> wrote:
>> >>
>> >> On 1/24/20 11:27 AM, Dan Williams wrote:
>> >>> On Mon, Jan 20, 2020 at 6:08 AM Aneesh Kumar K.V
>> >>>
>> >>
>> >> ....
>> >>
>> >>>>
>> >>>> +unsigned long arch_namespace_map_size(void)
>> >>>> +{
>> >>>> +       return PAGE_SIZE;
>> >>>> +}
>> >>>> +EXPORT_SYMBOL_GPL(arch_namespace_map_size);
>> >>>> +
>> >>>> +
>> >>>>    static void __cpa_flush_all(void *arg)
>> >>>>    {
>> >>>>           unsigned long cache = (unsigned long)arg;
>> >>>> diff --git a/include/linux/libnvdimm.h b/include/linux/libnvdimm.h
>> >>>> index 9df091bd30ba..a3476dbd2656 100644
>> >>>> --- a/include/linux/libnvdimm.h
>> >>>> +++ b/include/linux/libnvdimm.h
>> >>>> @@ -284,4 +284,5 @@ static inline void arch_invalidate_pmem(void *addr, size_t size)
>> >>>>    }
>> >>>>    #endif
>> >>>>
>> >>>> +unsigned long arch_namespace_map_size(void);
>> >>>
>> >>> This property is more generic than the nvdimm namespace mapping size,
>> >>> it's more the fundamental remap granularity that the architecture
>> >>> supports. So I would expect this to be defined in core header files.
>> >>> Something like:
>> >>>
>> >>> diff --git a/include/linux/io.h b/include/linux/io.h
>> >>> index a59834bc0a11..58b3b2091dbb 100644
>> >>> --- a/include/linux/io.h
>> >>> +++ b/include/linux/io.h
>> >>> @@ -155,6 +155,13 @@ enum {
>> >>>    void *memremap(resource_size_t offset, size_t size, unsigned long flags);
>> >>>    void memunmap(void *addr);
>> >>>
>> >>> +#ifndef memremap_min_align
>> >>> +static inline unsigned int memremap_min_align(void)
>> >>> +{
>> >>> +       return PAGE_SIZE;
>> >>> +}
>> >>> +#endif
>> >>> +
>> >>
>> >>
>> >> Should that be memremap_pages_min_align()?
>> >
>> > No, and on second look it needs to be a common value that results in
>> > properly aligned / sized namespaces across architectures.
>> >
>> > What would it take for Power to make it's minimum mapping granularity
>> > SUBSECTION_SIZE? The minute that the minimum alignment changes across
>> > architectures we lose compatibility.
>> >
>> > The namespaces need to be sized such that the mode can be changed freely.
>> >
>>
>> Linux on ppc64 with hash translation use just one page size for direct
>> mapping and that is 16MB.
>
> Ok, I think this means that the dream of SUBSECTION_SIZE being the
> minimum compat alignment is dead, or at least a dream deferred.
>
> Let's do this, change the name of this function to:
>
>     memremap_compat_align()
>
> ...and define it to be the max() of all the alignment constraints that
> the arch may require through either memremap(), or memremap_pages().
> Then, teach ndctl to make its default alignment compatible by default,
> 16MiB, with an override to allow namespace creation with the current
> architecture's memremap_compat_align(), exported via sysfs, if it
> happens to be less then 16MiB. Finally, cross our fingers and hope
> that Power remains the only arch that violates the SUBSECTION_SIZE
> minimum value for memremap_compat_align().

We do have two issues related to alignment here.

1) With upstream kernel, we don't validate the namespace start and size
value and hence we can end up creating namespace that is not aligned to
SUBSECTION_SIZE. This was observed by Jeff Moyer in his test. That means
we will fail to enable already created namespace if we use
SUBSECTION_SIZE to validate their alignment.

The solution I came up with was arch_namespace_map_size() that depends on the
direct-map mapping page size. On architecture like ppc64, this value can
be 16MB. 

3) For new namespaces, we can now ensure they are properly
aligned. For architectures other than ppc64 that value is SUBSECTION_SIZE;
ie, the resource start address and the size value should be aligned to
SUBSECTION_SIZE. For ppc64 this value should be 16MB because if they are
not 16MB aligned we cannot direct-map them.

I guess this can be memremap_compat_align() and we expose this value via
namespace attribute. By default, all architecture will now to try to
align things to 16MB unless specified --nocompat as ndctl
create-namespace command-line option. When used we use the
architecture-specific sysfs value (SUBSECTION_SIZE) to align things
correctly.


-aneesh
