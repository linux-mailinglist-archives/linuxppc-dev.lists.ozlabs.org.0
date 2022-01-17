Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD18490A0A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 15:12:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jcv4H4JGzz3bTS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 01:12:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=roNnJwTG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=roNnJwTG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jcv3S3TDMz2y0B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 01:11:47 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20HD4oNS030961; 
 Mon, 17 Jan 2022 14:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=RR4wAK0oKuGnVDZ6o0dkNYmUI7MBHwJgSR49ywyLBfw=;
 b=roNnJwTG859cp9+XiA1SpZCc1Byer4Jxkd50r0tGIwV+2FaIygLPY79cj4XTo81jtX7W
 EgFi5g+q/BD3d6tVo1kTbVOrsvtyaO3g/lCPVaN5R91JxIoNe1XuaDx6ydmJiYW9Q+dx
 SY537a+/jPGPLciZmoD3cRTBFiyBOYmFfFpW7clGtGv/qF4UFkfNHyEpB8HSe3y2U66t
 sxQzkuXtWIhJlUbT1qiFpRjR3OuNlFF6QV73n/zgBaYVZxlvbw+ucdg7mgo3QvZwiFvS
 i+prxrN0551dZZumJwzJHvyFt7RoU2xp5KSm4VuWCqnJ1tcQQUdLbHtxlom9LKO4gW4W Mg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn81fjj0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 14:11:36 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20HE8rbt024506;
 Mon, 17 Jan 2022 14:11:34 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3dknhhv1a4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 14:11:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20HEBT0L43975156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 14:11:29 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DCB94C052;
 Mon, 17 Jan 2022 14:11:29 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A88C34C044;
 Mon, 17 Jan 2022 14:11:26 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.43.40.68])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 17 Jan 2022 14:11:26 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Mon, 17 Jan 2022 19:41:25 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, nvdimm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3] powerpc/papr_scm: Implement initial support for
 injecting smart errors
In-Reply-To: <871r167oi5.fsf@linux.ibm.com>
References: <20220113120252.1145671-1-vaibhav@linux.ibm.com>
 <871r167oi5.fsf@linux.ibm.com>
Date: Mon, 17 Jan 2022 19:41:25 +0530
Message-ID: <87lezeih9u.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j-hmCMZjmRQLpNaA9kYAcIbDWg_G08fJ
X-Proofpoint-ORIG-GUID: j-hmCMZjmRQLpNaA9kYAcIbDWg_G08fJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_06,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201170090
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
Cc: Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Shivaprasad G Bhat <sbhat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for reviewing this patch Aneesh. My responses to your comments
below:

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> Vaibhav Jain <vaibhav@linux.ibm.com> writes:
>
>> Presently PAPR doesn't support injecting smart errors on an
>> NVDIMM. This makes testing the NVDIMM health reporting functionality
>> difficult as simulating NVDIMM health related events need a hacked up
>> qemu version.
>>
>> To solve this problem this patch proposes simulating certain set of
>> NVDIMM health related events in papr_scm. Specifically 'fatal' health
>> state and 'dirty' shutdown state. These error can be injected via the
>> user-space 'ndctl-inject-smart(1)' command. With the proposed patch and
>> corresponding ndctl patches following command flow is expected:
>>
>> $ sudo ndctl list -DH -d nmem0
>> ...
>>       "health_state":"ok",
>>       "shutdown_state":"clean",
>> ...
>>  # inject unsafe shutdown and fatal health error
>> $ sudo ndctl inject-smart nmem0 -Uf
>> ...
>>       "health_state":"fatal",
>>       "shutdown_state":"dirty",
>> ...
>>  # uninject all errors
>> $ sudo ndctl inject-smart nmem0 -N
>> ...
>>       "health_state":"ok",
>>       "shutdown_state":"clean",
>> ...
>>
>> The patch adds two members 'health_bitmap_mask' and
>> 'health_bitmap_override' inside struct papr_scm_priv which are then
>> bit blt'ed to the health bitmaps fetched from the hypervisor. In case
>> we are not able to fetch health information from the hypervisor we
>> service the health bitmap from these two members. These members are
>> accessible from sysfs at nmemX/papr/health_bitmap_override
>>
>> A new PDSM named 'SMART_INJECT' is proposed that accepts newly
>> introduced 'struct nd_papr_pdsm_smart_inject' as payload thats
>> exchanged between libndctl and papr_scm to indicate the requested
>> smart-error states.
>>
>> When the processing the PDSM 'SMART_INJECT', papr_pdsm_smart_inject()
>> constructs a pair or 'mask' and 'override' bitmaps from the payload
>> and bit-blt it to the 'health_bitmap_{mask, override}' members. This
>> ensures the after being fetched from the hypervisor, the health_bitmap
>> reflects requested smart-error states.
>>
>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
>> ---
>> Changelog:
>>
>> Since v2:
>> * Rebased the patch to ppc-next
>> * Added documentation for newly introduced sysfs attribute 'health_bitmap_override'
>>
>> Since v1:
>> * Updated the patch description.
>> * Removed dependency of a header movement patch.
>> * Removed '__packed' attribute for 'struct nd_papr_pdsm_smart_inject' [Aneesh]
>> ---
>>  Documentation/ABI/testing/sysfs-bus-papr-pmem | 13 +++
>>  arch/powerpc/include/uapi/asm/papr_pdsm.h     | 18 ++++
>>  arch/powerpc/platforms/pseries/papr_scm.c     | 94 ++++++++++++++++++-
>>  3 files changed, 122 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-papr-pmem b/Documentation/ABI/testing/sysfs-bus-papr-pmem
>> index 95254cec92bf..8a0b2a7f7671 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-papr-pmem
>> +++ b/Documentation/ABI/testing/sysfs-bus-papr-pmem
>> @@ -61,3 +61,16 @@ Description:
>>  		* "CchRHCnt" : Cache Read Hit Count
>>  		* "CchWHCnt" : Cache Write Hit Count
>>  		* "FastWCnt" : Fast Write Count
>> +
>> +What:		/sys/bus/nd/devices/nmemX/papr/health_bitmap_override
>> +Date:		Jan, 2022
>> +KernelVersion:	v5.17
>> +Contact:	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, nvdimm@lists.linux.dev,
>> +Description:
>> +		(RO) Reports the health bitmap override/mask bitmaps that are
>> +		applied to top bitmap received from PowerVM via the H_SCM_HEALTH
>> +		Hcall. Together these can be used to forcibly set/reset specific
>> +		bits returned from Hcall. These bitmaps are presently used to
>> +		simulate various health or shutdown states for an nvdimm and are
>> +		set by user-space tools like ndctl by issuing a PAPR DSM.
>> +
>> diff --git a/arch/powerpc/include/uapi/asm/papr_pdsm.h b/arch/powerpc/include/uapi/asm/papr_pdsm.h
>> index 82488b1e7276..17439925045c 100644
>> --- a/arch/powerpc/include/uapi/asm/papr_pdsm.h
>> +++ b/arch/powerpc/include/uapi/asm/papr_pdsm.h
>> @@ -116,6 +116,22 @@ struct nd_papr_pdsm_health {
>>  	};
>>  };
>>  
>> +/* Flags for injecting specific smart errors */
>> +#define PDSM_SMART_INJECT_HEALTH_FATAL		(1 << 0)
>> +#define PDSM_SMART_INJECT_BAD_SHUTDOWN		(1 << 1)
>> +
>> +struct nd_papr_pdsm_smart_inject {
>> +	union {
>> +		struct {
>> +			/* One or more of PDSM_SMART_INJECT_ */
>> +			__u32 flags;
>> +			__u8 fatal_enable;
>> +			__u8 unsafe_shutdown_enable;
>> +		};
>> +		__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
>> +	};
>> +};
>> +
>>  /*
>>   * Methods to be embedded in ND_CMD_CALL request. These are sent to the kernel
>>   * via 'nd_cmd_pkg.nd_command' member of the ioctl struct
>> @@ -123,12 +139,14 @@ struct nd_papr_pdsm_health {
>>  enum papr_pdsm {
>>  	PAPR_PDSM_MIN = 0x0,
>>  	PAPR_PDSM_HEALTH,
>> +	PAPR_PDSM_SMART_INJECT,
>>  	PAPR_PDSM_MAX,
>>  };
>>  
>>  /* Maximal union that can hold all possible payload types */
>>  union nd_pdsm_payload {
>>  	struct nd_papr_pdsm_health health;
>> +	struct nd_papr_pdsm_smart_inject smart_inject;
>>  	__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
>>  } __packed;
>>  
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> index f48e87ac89c9..de4cf329cfb3 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -68,6 +68,10 @@
>>  #define PAPR_SCM_PERF_STATS_EYECATCHER __stringify(SCMSTATS)
>>  #define PAPR_SCM_PERF_STATS_VERSION 0x1
>>  
>> +/* Use bitblt method to override specific bits in the '_bitmap_' */
>> +#define BITBLT_BITMAP(_bitmap_, _mask_, _override_)		\
>> +	(((_bitmap_) & ~(_mask_)) | ((_mask_) & (_override_)))
>> +
>>  /* Struct holding a single performance metric */
>>  struct papr_scm_perf_stat {
>>  	u8 stat_id[8];
>> @@ -120,6 +124,12 @@ struct papr_scm_priv {
>>  
>>  	/* length of the stat buffer as expected by phyp */
>>  	size_t stat_buffer_len;
>> +
>> +	/* The bits which needs to be overridden */
>> +	u64 health_bitmap_mask;
>> +
>> +	/* The overridden values for the bits having the masks set */
>> +	u64 health_bitmap_override;
>>  };
>>  
>>  static int papr_scm_pmem_flush(struct nd_region *nd_region,
>> @@ -347,19 +357,28 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
>>  static int __drc_pmem_query_health(struct papr_scm_priv *p)
>>  {
>>  	unsigned long ret[PLPAR_HCALL_BUFSIZE];
>> +	u64 bitmap = 0;
>>  	long rc;
>>  
>>  	/* issue the hcall */
>>  	rc = plpar_hcall(H_SCM_HEALTH, ret, p->drc_index);
>> -	if (rc != H_SUCCESS) {
>> +	if (rc == H_SUCCESS)
>> +		bitmap = ret[0] & ret[1];
>> +	else if (rc == H_FUNCTION)
>> +		dev_info_once(&p->pdev->dev,
>> +			      "Hcall H_SCM_HEALTH not implemented, assuming empty health bitmap");
>> +	else {
>> +
>>  		dev_err(&p->pdev->dev,
>>  			"Failed to query health information, Err:%ld\n", rc);
>>  		return -ENXIO;
>>  	}
>>  
>>  	p->lasthealth_jiffies = jiffies;
>> -	p->health_bitmap = ret[0] & ret[1];
>> -
>> +	/* Allow overriding specific health bits via bit blt. */
>> +	bitmap = BITBLT_BITMAP(bitmap, p->health_bitmap_mask,
>> +			       p->health_bitmap_override);
>> +	WRITE_ONCE(p->health_bitmap, bitmap);
>
> Why WRITE_ONCE ?
>
flags_show() uses READ_ONCE() to read a consistent copy of health_bitmap
to report nvdimm flags. Hence to ensure writes to health_bitmap are atomic
and consistent WRITE_ONCE is used. Though on ppc64 it may not make much
difference since loads/stores are 64bit but to be consistent across
flags_show() and __drc_pmem_query_health the store to p->health_bitmap
is replaced with a WRITE_ONCE.

>>  	dev_dbg(&p->pdev->dev,
>>  		"Queried dimm health info. Bitmap:0x%016lx Mask:0x%016lx\n",
>>  		ret[0], ret[1]);
>> @@ -669,6 +688,54 @@ static int papr_pdsm_health(struct papr_scm_priv *p,
>>  	return rc;
>>  }
>>  
>> +/* Inject a smart error Add the dirty-shutdown-counter value to the pdsm */
>> +static int papr_pdsm_smart_inject(struct papr_scm_priv *p,
>> +				  union nd_pdsm_payload *payload)
>> +{
>> +	int rc;
>> +	u32 supported_flags = 0;
>> +	u64 mask = 0, override = 0;
>> +
>> +	/* Check for individual smart error flags and update mask and override */
>> +	if (payload->smart_inject.flags & PDSM_SMART_INJECT_HEALTH_FATAL) {
>> +		supported_flags |= PDSM_SMART_INJECT_HEALTH_FATAL;
>> +		mask |= PAPR_PMEM_HEALTH_FATAL;
>> +		override |= payload->smart_inject.fatal_enable ?
>> +			PAPR_PMEM_HEALTH_FATAL : 0;
>> +	}
>> +
>> +	if (payload->smart_inject.flags & PDSM_SMART_INJECT_BAD_SHUTDOWN) {
>> +		supported_flags |= PDSM_SMART_INJECT_BAD_SHUTDOWN;
>> +		mask |= PAPR_PMEM_SHUTDOWN_DIRTY;
>> +		override |= payload->smart_inject.unsafe_shutdown_enable ?
>> +			PAPR_PMEM_SHUTDOWN_DIRTY : 0;
>> +	}
>> +
>> +	dev_dbg(&p->pdev->dev, "[Smart-inject] Mask=%#llx override=%#llx\n",
>> +		mask, override);
>> +
>> +	/* Prevent concurrent access to dimm health bitmap related members */
>> +	rc = mutex_lock_interruptible(&p->health_mutex);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Bitblt mask/override to corrosponding health_bitmap couterparts */
>> +	p->health_bitmap_mask = BITBLT_BITMAP(p->health_bitmap_mask,
>> +					      mask, override);
>
> is that correct? Should we do that mask & override ? Shouldn't this be 
> 	p->health_bitmap_mask = BITBLT_BITMAP(p->health_bitmap_mask,
> 					      mask, ~0x0UL);
>
Just using 'mask' provides ability to only reset specific bits in the
health_bitmap. Coupled with 'override' specific bits in the bitmap can
be forced to be both set/reset since 'override' is ored to the
final bitmap.

This would be useful when adding support for injecting nvdimm restore
failure conditions which are indicated by absence of bit
PAPR_PMEM_SHUTDOWN_CLEAN in the health bitmap. That condition can be
simulated with mask == PAPR_PMEM_SHUTDOWN_CLEAN && override == 0. This
will ensure that bit PAPR_PMEM_SHUTDOWN_CLEAN is always reset in the
resulting health_bitmap.

>> +	p->health_bitmap_override = BITBLT_BITMAP(p->health_bitmap_override,
>> +						  mask, override);
>> +
>> +	/* Invalidate cached health bitmap */
>> +	p->lasthealth_jiffies = 0;
>> +
>> +	mutex_unlock(&p->health_mutex);
>> +
>> +	/* Return the supported flags back to userspace */
>> +	payload->smart_inject.flags = supported_flags;
>> +
>> +	return sizeof(struct nd_papr_pdsm_health);
>> +}
>> +
>>  /*
>>   * 'struct pdsm_cmd_desc'
>>   * Identifies supported PDSMs' expected length of in/out payloads
>> @@ -702,6 +769,12 @@ static const struct pdsm_cmd_desc __pdsm_cmd_descriptors[] = {
>>  		.size_out = sizeof(struct nd_papr_pdsm_health),
>>  		.service = papr_pdsm_health,
>>  	},
>> +
>> +	[PAPR_PDSM_SMART_INJECT] = {
>> +		.size_in = sizeof(struct nd_papr_pdsm_smart_inject),
>> +		.size_out = sizeof(struct nd_papr_pdsm_smart_inject),
>> +		.service = papr_pdsm_smart_inject,
>> +	},
>>  	/* Empty */
>>  	[PAPR_PDSM_MAX] = {
>>  		.size_in = 0,
>> @@ -838,6 +911,20 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
>>  	return 0;
>>  }
>>  
>> +static ssize_t health_bitmap_override_show(struct device *dev,
>> +					   struct device_attribute *attr,
>> +					   char *buf)
>> +{
>> +	struct nvdimm *dimm = to_nvdimm(dev);
>> +	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
>> +
>> +	return sprintf(buf, "mask=%#llx override=%#llx\n",
>> +		       READ_ONCE(p->health_bitmap_mask),
>> +		       READ_ONCE(p->health_bitmap_override));
>> +}
>> +
>> +static DEVICE_ATTR_ADMIN_RO(health_bitmap_override);
>> +
>>  static ssize_t perf_stats_show(struct device *dev,
>>  			       struct device_attribute *attr, char *buf)
>>  {
>> @@ -952,6 +1039,7 @@ static struct attribute *papr_nd_attributes[] = {
>>  	&dev_attr_flags.attr,
>>  	&dev_attr_perf_stats.attr,
>>  	&dev_attr_dirty_shutdown.attr,
>> +	&dev_attr_health_bitmap_override.attr,
>>  	NULL,
>>  };
>>  
>> -- 
>> 2.34.1

-- 
Cheers
~ Vaibhav
