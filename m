Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A81231B038A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 09:57:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495JvL3gvGzDqvp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 17:57:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495HyW0bd7zDqVL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 17:14:58 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03K73K1E039191
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 03:14:54 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30ggxnfwxd-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 03:14:53 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Mon, 20 Apr 2020 08:14:07 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 Apr 2020 08:14:05 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03K7EliN51773540
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Apr 2020 07:14:47 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10B10A4065;
 Mon, 20 Apr 2020 07:14:47 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDC5BA4054;
 Mon, 20 Apr 2020 07:14:42 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.199.35.142])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 20 Apr 2020 07:14:42 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Mon, 20 Apr 2020 12:44:41 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v5 4/4] powerpc/papr_scm: Implement support for
 DSM_PAPR_SCM_HEALTH
In-Reply-To: <CAPcyv4gnrp1NCAvbsa=DN+VrWFPcGm6WNO8-CahaJDPHpEafSg@mail.gmail.com>
References: <20200331143229.306718-1-vaibhav@linux.ibm.com>
 <20200331143229.306718-5-vaibhav@linux.ibm.com>
 <CAPcyv4gnrp1NCAvbsa=DN+VrWFPcGm6WNO8-CahaJDPHpEafSg@mail.gmail.com>
Date: Mon, 20 Apr 2020 12:44:41 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 20042007-0016-0000-0000-00000307C53D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042007-0017-0000-0000-0000336BD559
Message-Id: <87a736fx26.fsf@vajain21.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_02:2020-04-17,
 2020-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004200063
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
Cc: Alastair D'Silva <alastair@au1.ibm.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Jeff Moyer <jmoyer@redhat.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Dan / Mpe,

I have sent out a v6 of this patch set that addresses your review
comments so far. Also I have added a new doc patch in the patchset that
adds documentation for PAPR_SCM_HEALTH hcall specification.

Requesting you to please review the new patchset at
https://lore.kernel.org/linux-nvdimm/20200420070711.223545-1-vaibhav@linux.ibm.com

Thanks,
~ Vaibhav Jain

Dan Williams <dan.j.williams@intel.com> writes:

> On Tue, Mar 31, 2020 at 7:33 AM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>>
>> This patch implements support for papr_scm command
>> 'DSM_PAPR_SCM_HEALTH' that returns a newly introduced 'struct
>> nd_papr_scm_dimm_health_stat' instance containing dimm health
>> information back to user space in response to ND_CMD_CALL. This
>> functionality is implemented in newly introduced papr_scm_get_health()
>> that queries the scm-dimm health information and then copies these bitmaps
>> to the package payload whose layout is defined by 'struct
>> papr_scm_ndctl_health'.
>>
>> The patch also introduces a new member a new member 'struct
>> papr_scm_priv.health' thats an instance of 'struct
>> nd_papr_scm_dimm_health_stat' to cache the health information of a
>> scm-dimm. As a result functions drc_pmem_query_health() and
>> papr_flags_show() are updated to populate and use this new struct
>> instead of two be64 integers that we earlier used.
>
> Link to HCALL specification?
>
>>
>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>> ---
>> Changelog:
>>
>> v4..v5: None
>>
>> v3..v4: Call the DSM_PAPR_SCM_HEALTH service function from
>>         papr_scm_service_dsm() instead of papr_scm_ndctl(). [Aneesh]
>>
>> v2..v3: Updated struct nd_papr_scm_dimm_health_stat_v1 to use '__xx'
>>         types as its exported to the userspace [Aneesh]
>>         Changed the constants DSM_PAPR_SCM_DIMM_XX indicating dimm
>>         health from enum to #defines [Aneesh]
>>
>> v1..v2: New patch in the series
>> ---
>>  arch/powerpc/include/uapi/asm/papr_scm_dsm.h |  40 +++++++
>>  arch/powerpc/platforms/pseries/papr_scm.c    | 109 ++++++++++++++++---
>>  2 files changed, 132 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/powerpc/include/uapi/asm/papr_scm_dsm.h b/arch/powerpc/include/uapi/asm/papr_scm_dsm.h
>> index c039a49b41b4..8265125304ca 100644
>> --- a/arch/powerpc/include/uapi/asm/papr_scm_dsm.h
>> +++ b/arch/powerpc/include/uapi/asm/papr_scm_dsm.h
>> @@ -132,6 +132,7 @@ struct nd_papr_scm_cmd_pkg {
>>   */
>>  enum dsm_papr_scm {
>>         DSM_PAPR_SCM_MIN =  0x10000,
>> +       DSM_PAPR_SCM_HEALTH,
>>         DSM_PAPR_SCM_MAX,
>>  };
>>
>> @@ -158,4 +159,43 @@ static void *papr_scm_pcmd_to_payload(struct nd_papr_scm_cmd_pkg *pcmd)
>>         else
>>                 return (void *)((__u8 *) pcmd + pcmd->payload_offset);
>>  }
>> +
>> +/* Various scm-dimm health indicators */
>> +#define DSM_PAPR_SCM_DIMM_HEALTHY       0
>> +#define DSM_PAPR_SCM_DIMM_UNHEALTHY     1
>> +#define DSM_PAPR_SCM_DIMM_CRITICAL      2
>> +#define DSM_PAPR_SCM_DIMM_FATAL         3
>> +
>> +/*
>> + * Struct exchanged between kernel & ndctl in for PAPR_DSM_PAPR_SMART_HEALTH
>> + * Various bitflags indicate the health status of the dimm.
>> + *
>> + * dimm_unarmed                : Dimm not armed. So contents wont persist.
>> + * dimm_bad_shutdown   : Previous shutdown did not persist contents.
>> + * dimm_bad_restore    : Contents from previous shutdown werent restored.
>> + * dimm_scrubbed       : Contents of the dimm have been scrubbed.
>> + * dimm_locked         : Contents of the dimm cant be modified until CEC reboot
>> + * dimm_encrypted      : Contents of dimm are encrypted.
>> + * dimm_health         : Dimm health indicator.
>> + */
>> +struct nd_papr_scm_dimm_health_stat_v1 {
>> +       __u8 dimm_unarmed;
>> +       __u8 dimm_bad_shutdown;
>> +       __u8 dimm_bad_restore;
>> +       __u8 dimm_scrubbed;
>> +       __u8 dimm_locked;
>> +       __u8 dimm_encrypted;
>> +       __u16 dimm_health;
>> +};
>
> Does the structure pack the same across different compilers and configurations?
>
>> +
>> +/*
>> + * Typedef the current struct for dimm_health so that any application
>> + * or kernel recompiled after introducing a new version automatically
>> + * supports the new version.
>> + */
>> +#define nd_papr_scm_dimm_health_stat nd_papr_scm_dimm_health_stat_v1
>> +
>> +/* Current version number for the dimm health struct */
>> +#define ND_PAPR_SCM_DIMM_HEALTH_VERSION 1
>> +
>>  #endif /* _UAPI_ASM_POWERPC_PAPR_SCM_DSM_H_ */
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> index e8ce96d2249e..ce94762954e0 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -47,8 +47,7 @@ struct papr_scm_priv {
>>         struct mutex dimm_mutex;
>>
>>         /* Health information for the dimm */
>> -       __be64 health_bitmap;
>> -       __be64 health_bitmap_valid;
>> +       struct nd_papr_scm_dimm_health_stat health;
>>  };
>>
>>  static int drc_pmem_bind(struct papr_scm_priv *p)
>> @@ -158,6 +157,7 @@ static int drc_pmem_query_health(struct papr_scm_priv *p)
>>  {
>>         unsigned long ret[PLPAR_HCALL_BUFSIZE];
>>         int64_t rc;
>> +       __be64 health;
>>
>>         rc = plpar_hcall(H_SCM_HEALTH, ret, p->drc_index);
>>         if (rc != H_SUCCESS) {
>> @@ -172,13 +172,41 @@ static int drc_pmem_query_health(struct papr_scm_priv *p)
>>                 return rc;
>>
>>         /* Store the retrieved health information in dimm platform data */
>> -       p->health_bitmap = ret[0];
>> -       p->health_bitmap_valid = ret[1];
>> +       health = ret[0] & ret[1];
>>
>>         dev_dbg(&p->pdev->dev,
>>                 "Queried dimm health info. Bitmap:0x%016llx Mask:0x%016llx\n",
>> -               be64_to_cpu(p->health_bitmap),
>> -               be64_to_cpu(p->health_bitmap_valid));
>> +               be64_to_cpu(ret[0]),
>> +               be64_to_cpu(ret[1]));
>> +
>> +       memset(&p->health, 0, sizeof(p->health));
>> +
>> +       /* Check for various masks in bitmap and set the buffer */
>> +       if (health & PAPR_SCM_DIMM_UNARMED_MASK)
>> +               p->health.dimm_unarmed = true;
>> +
>> +       if (health & PAPR_SCM_DIMM_BAD_SHUTDOWN_MASK)
>> +               p->health.dimm_bad_shutdown = true;
>> +
>> +       if (health & PAPR_SCM_DIMM_BAD_RESTORE_MASK)
>> +               p->health.dimm_bad_restore = true;
>> +
>> +       if (health & PAPR_SCM_DIMM_ENCRYPTED)
>> +               p->health.dimm_encrypted = true;
>> +
>> +       if (health & PAPR_SCM_DIMM_SCRUBBED_AND_LOCKED) {
>> +               p->health.dimm_locked = true;
>> +               p->health.dimm_scrubbed = true;
>> +       }
>
> I don't think bool is suitable for ioctl ABI. For example the true
> value may be positive, or negative depending on the arch. This should
> be using explicit integer values.
>
> I assume the reason you are translating this rather than transmitting
> that raw 64-bit health value is for future compatibility if the HCALL
> format changes / is extended?
>
>> +
>> +       if (health & PAPR_SCM_DIMM_HEALTH_UNHEALTHY)
>> +               p->health.dimm_health = DSM_PAPR_SCM_DIMM_UNHEALTHY;
>> +
>> +       if (health & PAPR_SCM_DIMM_HEALTH_CRITICAL)
>> +               p->health.dimm_health = DSM_PAPR_SCM_DIMM_CRITICAL;
>> +
>> +       if (health & PAPR_SCM_DIMM_HEALTH_FATAL)
>> +               p->health.dimm_health = DSM_PAPR_SCM_DIMM_FATAL;
>
>>
>>         mutex_unlock(&p->dimm_mutex);
>>         return 0;
>> @@ -331,6 +359,51 @@ static int is_cmd_valid(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
>>         return 0;
>>  }
>>
>> +/* Fetch the DIMM health info and populate it in provided package. */
>> +static int papr_scm_get_health(struct papr_scm_priv *p,
>> +                              struct nd_papr_scm_cmd_pkg *pkg)
>> +{
>> +       int rc;
>> +       size_t copysize = sizeof(p->health);
>> +
>> +       rc = drc_pmem_query_health(p);
>> +       if (rc)
>> +               goto out;
>> +       /*
>> +        * If the requested payload version is greater than one we know
>> +        * about, return the payload version we know about and let
>> +        * caller/userspace handle.
>> +        */
>> +       if (pkg->payload_version > ND_PAPR_SCM_DIMM_HEALTH_VERSION)
>> +               pkg->payload_version = ND_PAPR_SCM_DIMM_HEALTH_VERSION;
>> +
>> +       if (pkg->hdr.nd_size_out < copysize) {
>> +               dev_dbg(&p->pdev->dev, "%s Payload not large enough\n",
>> +                       __func__);
>> +               dev_dbg(&p->pdev->dev, "%s Expected %lu, available %u\n",
>> +                       __func__, copysize, pkg->hdr.nd_size_out);
>> +               rc = -ENOSPC;
>> +               goto out;
>> +       }
>> +
>> +       dev_dbg(&p->pdev->dev, "%s Copying payload size=%lu version=0x%x\n",
>> +               __func__, copysize, pkg->payload_version);
>> +
>> +       /* Copy a subset of health struct based on copysize */
>> +       memcpy(papr_scm_pcmd_to_payload(pkg), &p->health, copysize);
>> +       pkg->hdr.nd_fw_size = copysize;
>> +
>> +out:
>> +       /*
>> +        * Put the error in out package and return success from function
>> +        * so that errors if any are propogated back to userspace.
>> +        */
>> +       pkg->cmd_status = rc;
>> +       dev_dbg(&p->pdev->dev, "%s completion code = %d\n", __func__, rc);
>> +
>> +       return 0;
>> +}
>> +
>>  static int papr_scm_service_dsm(struct papr_scm_priv *p,
>>                                 struct nd_papr_scm_cmd_pkg *call_pkg)
>>  {
>> @@ -345,6 +418,9 @@ static int papr_scm_service_dsm(struct papr_scm_priv *p,
>>
>>         /* Depending on the DSM command call appropriate service routine */
>>         switch (call_pkg->hdr.nd_command) {
>> +       case DSM_PAPR_SCM_HEALTH:
>> +               return papr_scm_get_health(p, call_pkg);
>> +
>>         default:
>>                 pr_debug("Unsupported DSM command 0x%llx\n",
>>                          call_pkg->hdr.nd_command);
>> @@ -431,7 +507,6 @@ static ssize_t papr_flags_show(struct device *dev,
>>  {
>>         struct nvdimm *dimm = to_nvdimm(dev);
>>         struct papr_scm_priv *p = nvdimm_provider_data(dimm);
>> -       __be64 health;
>>         int rc;
>>
>>         rc = drc_pmem_query_health(p);
>> @@ -443,26 +518,26 @@ static ssize_t papr_flags_show(struct device *dev,
>>         if (rc)
>>                 return rc;
>>
>> -       health = p->health_bitmap & p->health_bitmap_valid;
>> -
>> -       /* Check for various masks in bitmap and set the buffer */
>> -       if (health & PAPR_SCM_DIMM_UNARMED_MASK)
>> +       if (p->health.dimm_unarmed)
>>                 rc += sprintf(buf, "not_armed ");
>>
>> -       if (health & PAPR_SCM_DIMM_BAD_SHUTDOWN_MASK)
>> +       if (p->health.dimm_bad_shutdown)
>>                 rc += sprintf(buf + rc, "save_fail ");
>
> Per my patch1 comment is this "save_fail" or "flush_fail"?
>
>>
>> -       if (health & PAPR_SCM_DIMM_BAD_RESTORE_MASK)
>> +       if (p->health.dimm_bad_restore)
>>                 rc += sprintf(buf + rc, "restore_fail ");
>>
>> -       if (health & PAPR_SCM_DIMM_ENCRYPTED)
>> +       if (p->health.dimm_encrypted)
>>                 rc += sprintf(buf + rc, "encrypted ");
>>
>> -       if (health & PAPR_SCM_DIMM_SMART_EVENT_MASK)
>> +       if (p->health.dimm_health)
>>                 rc += sprintf(buf + rc, "smart_notify ");
>>
>> -       if (health & PAPR_SCM_DIMM_SCRUBBED_AND_LOCKED)
>> -               rc += sprintf(buf + rc, "scrubbed locked ");
>> +       if (p->health.dimm_scrubbed)
>> +               rc += sprintf(buf + rc, "scrubbed ");
>> +
>> +       if (p->health.dimm_locked)
>> +               rc += sprintf(buf + rc, "locked ");
>>
>>         if (rc > 0)
>>                 rc += sprintf(buf + rc, "\n");
>> --
>> 2.25.1
>>

-- 

