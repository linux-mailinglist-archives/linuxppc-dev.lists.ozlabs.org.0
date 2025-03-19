Return-Path: <linuxppc-dev+bounces-7199-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C27C1A68703
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 09:38:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHhtb0nh5z2yf7;
	Wed, 19 Mar 2025 19:38:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742373495;
	cv=none; b=bcqunRsIGecbD7iOUfsYgc0GXKa4t0mnPR3EV61XTD6ypgt47W3sZ3RuHimDjfjS3SXOhTYcoZ1nkuCXcd98xno0x99gZmcqHJlvCEpjwehcPzCcaLTASMqnC3khc0hxgZvj7d/MAzgkeiUcQsu8jwp6Ef/WGxe1wlBqvZAbEBqL321HpXVq1nkickePN03HsRaI2i1mmAXkFWLIkm6Rch5j2dDMlBIYhYOU0cjgxXX5hfdg3WceLSIIUWtzaqydicNsTLDnL4hKCkpXUkxf8UrOHV7GRrYPmrszpZ20dLofnucr3E0VOBR6DOWa6HZYVdBRIHLHmUIwPB9DuLk6ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742373495; c=relaxed/relaxed;
	bh=5P0ou98STZpgghc1UqmKlxfPc69VHOFn9SDvXbrHyhA=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=l3R6hZqZ+8eRPDO6yJl4nUKv3qJOzqZBlhPqYpmi3A5NvgZV1SUjy44CiGo8lXcbtvPRPd5QytO4zuzZGuLTDaJQhlbpdLjXtD/nA21b+S1t+CYaSSMrijhEI8DvnK7j3gIFujNfjcSD27FUzJmTXoUvVE/QuTOh3+uB8y8U0DygQbbxL06DmGRd9OKnEUZR34CdbBwQ4C5uwEiMGjgvYwAKYS447TtUgCsFAVlGRkencH7W+//1jmRqcV9+YZd40GD9boLEwLhEf3RQTAijgflo8PQPu3WKOaVzD0ubJKYpM2yiccvYL27h79x0GLB6SWpnbNgAtOJoVq+Ji6OX/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n5JxkyhF; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n5JxkyhF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHhtZ0mY1z2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 19:38:13 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J3jqut018599;
	Wed, 19 Mar 2025 08:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=5P0ou98STZpgghc1UqmKlxfPc69VHO
	Fn9SDvXbrHyhA=; b=n5JxkyhFTXM1ldu8xpYmZ8yuHUZIU+cQQOb3hMzTtLdd4z
	9g8DGUaQKSUiyj7dcO9oDUHw5mhChnPBlaBXWbyjrC0TizT7BA6EXVm5mzv/+dAD
	aplgeBii7kQeppohHPAbGRIzSbhiugEv5j22IO7/EpjUJvshVEd3cWXtCVQYVudr
	DTWlsF+O2SazVigRrhIj+lAwgHHTcev8vAHCnPjYp8Xl3NUdvOSnu8fwNv7ZeAD/
	0zrfGIPTh+hzBCdFVL0MZBem98em1kXQQpw0u+rO9HuG5cCzuP++XnmeAUpCkWEY
	OUKIhk9NicQy7VrDFTuwcq/vaS2TzBvLJZ5RM2WQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45fpa9h5yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 08:38:04 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52J8Uv6B019764;
	Wed, 19 Mar 2025 08:38:04 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45fpa9h5yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 08:38:04 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52J7XDPE005635;
	Wed, 19 Mar 2025 08:38:03 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45dm900qsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 08:38:02 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52J8bxaY55837156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Mar 2025 08:37:59 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED47D20040;
	Wed, 19 Mar 2025 08:37:58 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D298220049;
	Wed, 19 Mar 2025 08:37:56 +0000 (GMT)
Received: from [9.199.155.138] (unknown [9.199.155.138])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Mar 2025 08:37:56 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------nxhmRf3MqlUKCdctk9a0zSU8"
Message-ID: <57ed7a07-bb81-45f5-9109-b26cdb868c87@linux.ibm.com>
Date: Wed, 19 Mar 2025 14:07:55 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/7] Add character devices for indices, platform-dump
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com
References: <20250315092756.1031182-1-haren@linux.ibm.com>
Content-Language: en-US
From: Sathvika Vasireddy <sv@linux.ibm.com>
In-Reply-To: <20250315092756.1031182-1-haren@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GP-kxDEGsoT7a-vXvAGmB50XeACQA7Za
X-Proofpoint-ORIG-GUID: f3KOr-4IZEXRiwy3UOsxMirbJE3giUif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_02,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190058
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is a multi-part message in MIME format.
--------------nxhmRf3MqlUKCdctk9a0zSU8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/15/25 2:57 PM, Haren Myneni wrote:
> Several APIs such as rtas_get_indices(), rtas_get_dynamic_sensor(),
> rtas_set_dynamic_indicator(), rtas_platform_dump() and
> rtas_physical_attestation()  provided by librtas library are
> implemented in user space using rtas syscall in combination with
> writable mappings of /dev/mem. But this implementation is not
> compatible with system lockdown which prohibits /dev/mem access.
> The current kernel already provides char based driver interfaces
> for several RTAS calls such as VPD and system parameters to
> support lockdown feature.
>
> This patch series adds new char based drivers, /dev/papr-indices
> for ibm,get-indices, ibm,get-dynamic-sensor-state and
> ibm,set-dynamic-indicator RTAS Calls. /dev/papr-platform-dump
> for ibm,platform-dump and /dev/papr-physical-attestation
> fir ibm,physical-attestation. Providing the similar
> open/ioctl/read interfaces to the user space as in the case of
> VPD and system parameters.
>
> I have made changes to librtas library to use the new kernel
> interfaces if the corresponding device entry is available.
>
> This patch series has the following patches:
> powerpc/pseries: Define common functions for RTAS sequence calls
> - For some of sequence based RTAS calls, the OS should not start
>    another sequence with different input until the previous sequence
>    is completed. So the sequence should be completed during ioctl()
>    and expose the entire buffer during read(). ibm,get-indices is
>    sequence based RTAS function similar to ibm,get-vpd and we already
>    have the corresponding implementation for VPD driver. So update
>    papr_rtas_sequence struct for RTAS call specific functions and move
>    the top level sequence functions in to a separate file.
>
> powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls
> - /dev/papr-indices driver supports ibm,get-indices,
>    ibm,get-dynamic-sensor-state and ibm,set-dynamic-indicator RTAS Calls.
>    papr-indices.h introduces 3 different ioctls for these RTAS calls and
>    the corresponding ioctl input buffer.
>
> powerpc/pseries: Add papr-indices char driver for ibm,get-indices
> - Introduce /dev/papr-indices char based driver and add support for
>    get-indices RTAS function
>
> powerpc/pseries: Add ibm,set-dynamic-indicator RTAS call support
> - Update /dev/papr-indices for set-dynamic-indicator RTAS function
>
> powerpc/pseries: Add ibm,get-dynamic-sensor-state RTAS call support
> -  Update /dev/papr-indices for  get-dynamic-sensor-state RTAS function
>
> powerpc/pseries: Add papr-platform-dump character driver for dump
>     retrieval
> - Introduce /dev/papr-platform-dump char driver and adds support for
>    ibm,platform-dump. Received suggestions from the previous post as a
>    separate patch - Updated the patch with invalidating the dump using
>    a separate ioctl.
>
> powerpc/pseries: Add a char driver for papr-physical-attestation RTAS
> - Introduce /dev/papr-physical-attestation char driver to provide
>    kernel interface for ibm,physical-attestation RTAS function.
>
> Thanks to Sathvika Vasireddy for testing these kernel APIs with various
> tools.
>   
> Changelog:
> v9:
> - Fixed syntax issue in papr-rtas-common.c as reported by
>    Mukesh Kumar Chaurasiya
>
> v8:
> - Fixed build warnings for the proper function parameter descriptions
>    (vpd_sequence_begin(), few papr_rtas_*() functions, and etc) as
>    reported by kernel test robot<lkp@intel.com>
>
> v7:
> - Pass the proper next value to the subsequent RTAS calls for the
>    get-indices sequence RTAS.
>    (Vasireddy Sathvika found this bug).
>
> v6:
> - Define the proper command ID for PAPR_PHY_ATTEST_IOC_HANDLE ioctl
> - Update ioctls description in ioctl-number.rst.
>
> v5:
> - Return with -EINPROGRESS in papr_platform_dump_invalidate_ioctl()
>    if the complete dump is not read (Suggested by Michal Suchánek).
>
> v4:
> - Include patch "Add char driver for papr-physical-attestation RTAS"
>    in this series. ibm,physical-attestation is sequence based RTAS
>    call and the implementation is also similar to ibm,get-vpd and
>    ibm,get-indices.
>
> v3:
> - put_unused_fd() only after get_unused_fd() successful for the failure
>    case later ("Add papr-platform-dump character driver for dump
>    retrieval" patch).
>
> v2:
> - Added unlock rtas_ibm_set_dynamic_indicator_lock and
>    rtas_ibm_get_dynamic_sensor_state_lock mutex for failure cases
>    as reported by Dan Carpenter
> - Fixed build warnings for the proper function parameter descriptions
>    as reported by kernel test robot<lkp@intel.com>
>
> Haren Myneni (7):
>    powerpc/pseries: Define common functions for RTAS sequence calls
>    powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls
>    powerpc/pseries: Add papr-indices char driver for ibm,get-indices
>    powerpc/pseries: Add ibm,set-dynamic-indicator RTAS call support
>    powerpc/pseries: Add ibm,get-dynamic-sensor-state RTAS call support
>    powerpc/pseries: Add papr-platform-dump character driver for dump
>      retrieval
>    powerpc/pseries: Add a char driver for physical-attestation RTAS
>
>   .../userspace-api/ioctl/ioctl-number.rst      |   6 +
>   arch/powerpc/include/asm/rtas.h               |   4 +
>   arch/powerpc/include/uapi/asm/papr-indices.h  |  41 ++
>   .../uapi/asm/papr-physical-attestation.h      |  31 ++
>   .../include/uapi/asm/papr-platform-dump.h     |  15 +
>   arch/powerpc/kernel/rtas.c                    |   8 +-
>   arch/powerpc/platforms/pseries/Makefile       |   3 +-
>   arch/powerpc/platforms/pseries/papr-indices.c | 488 ++++++++++++++++++
>   .../platforms/pseries/papr-phy-attest.c       | 288 +++++++++++
>   .../platforms/pseries/papr-platform-dump.c    | 411 +++++++++++++++
>   .../platforms/pseries/papr-rtas-common.c      | 311 +++++++++++
>   .../platforms/pseries/papr-rtas-common.h      |  61 +++
>   arch/powerpc/platforms/pseries/papr-vpd.c     | 351 ++-----------
>   13 files changed, 1706 insertions(+), 312 deletions(-)
>   create mode 100644 arch/powerpc/include/uapi/asm/papr-indices.h
>   create mode 100644 arch/powerpc/include/uapi/asm/papr-physical-attestation.h
>   create mode 100644 arch/powerpc/include/uapi/asm/papr-platform-dump.h
>   create mode 100644 arch/powerpc/platforms/pseries/papr-indices.c
>   create mode 100644 arch/powerpc/platforms/pseries/papr-phy-attest.c
>   create mode 100644 arch/powerpc/platforms/pseries/papr-platform-dump.c
>   create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-common.c
>   create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-common.h
Userspace tools that use these interfaces are displaying consistent 
results across old/new librtas and kernel combinations.

For this series:
Tested-by: Sathvika Vasireddy <sv@linux.ibm.com>

Thanks,
Sathvika
--------------nxhmRf3MqlUKCdctk9a0zSU8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix"><font face="monospace">On 3/15/25 2:57
        PM, Haren Myneni wrote:</font><br>
    </div>
    <blockquote type="cite"
      cite="mid:20250315092756.1031182-1-haren@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">Several APIs such as rtas_get_indices(), rtas_get_dynamic_sensor(),
rtas_set_dynamic_indicator(), rtas_platform_dump() and
rtas_physical_attestation()  provided by librtas library are
implemented in user space using rtas syscall in combination with
writable mappings of /dev/mem. But this implementation is not
compatible with system lockdown which prohibits /dev/mem access.
The current kernel already provides char based driver interfaces
for several RTAS calls such as VPD and system parameters to
support lockdown feature.

This patch series adds new char based drivers, /dev/papr-indices
for ibm,get-indices, ibm,get-dynamic-sensor-state and
ibm,set-dynamic-indicator RTAS Calls. /dev/papr-platform-dump
for ibm,platform-dump and /dev/papr-physical-attestation
fir ibm,physical-attestation. Providing the similar
open/ioctl/read interfaces to the user space as in the case of
VPD and system parameters.

I have made changes to librtas library to use the new kernel
interfaces if the corresponding device entry is available.

This patch series has the following patches:
powerpc/pseries: Define common functions for RTAS sequence calls
- For some of sequence based RTAS calls, the OS should not start
  another sequence with different input until the previous sequence
  is completed. So the sequence should be completed during ioctl()
  and expose the entire buffer during read(). ibm,get-indices is
  sequence based RTAS function similar to ibm,get-vpd and we already
  have the corresponding implementation for VPD driver. So update
  papr_rtas_sequence struct for RTAS call specific functions and move
  the top level sequence functions in to a separate file.

powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls
- /dev/papr-indices driver supports ibm,get-indices,
  ibm,get-dynamic-sensor-state and ibm,set-dynamic-indicator RTAS Calls.
  papr-indices.h introduces 3 different ioctls for these RTAS calls and
  the corresponding ioctl input buffer.

powerpc/pseries: Add papr-indices char driver for ibm,get-indices
- Introduce /dev/papr-indices char based driver and add support for
  get-indices RTAS function

powerpc/pseries: Add ibm,set-dynamic-indicator RTAS call support
- Update /dev/papr-indices for set-dynamic-indicator RTAS function

powerpc/pseries: Add ibm,get-dynamic-sensor-state RTAS call support
-  Update /dev/papr-indices for  get-dynamic-sensor-state RTAS function

powerpc/pseries: Add papr-platform-dump character driver for dump
   retrieval
- Introduce /dev/papr-platform-dump char driver and adds support for
  ibm,platform-dump. Received suggestions from the previous post as a
  separate patch - Updated the patch with invalidating the dump using
  a separate ioctl.

powerpc/pseries: Add a char driver for papr-physical-attestation RTAS
- Introduce /dev/papr-physical-attestation char driver to provide
  kernel interface for ibm,physical-attestation RTAS function.

Thanks to Sathvika Vasireddy for testing these kernel APIs with various
tools.
 
Changelog:
v9:
- Fixed syntax issue in papr-rtas-common.c as reported by
  Mukesh Kumar Chaurasiya

v8:
- Fixed build warnings for the proper function parameter descriptions
  (vpd_sequence_begin(), few papr_rtas_*() functions, and etc) as
  reported by kernel test robot <a class="moz-txt-link-rfc2396E" href="mailto:lkp@intel.com">&lt;lkp@intel.com&gt;</a>

v7:
- Pass the proper next value to the subsequent RTAS calls for the
  get-indices sequence RTAS.
  (Vasireddy Sathvika found this bug).

v6:
- Define the proper command ID for PAPR_PHY_ATTEST_IOC_HANDLE ioctl
- Update ioctls description in ioctl-number.rst.

v5:
- Return with -EINPROGRESS in papr_platform_dump_invalidate_ioctl()
  if the complete dump is not read (Suggested by Michal Suchánek).

v4:
- Include patch "Add char driver for papr-physical-attestation RTAS"
  in this series. ibm,physical-attestation is sequence based RTAS
  call and the implementation is also similar to ibm,get-vpd and
  ibm,get-indices.

v3:
- put_unused_fd() only after get_unused_fd() successful for the failure
  case later ("Add papr-platform-dump character driver for dump
  retrieval" patch).

v2:
- Added unlock rtas_ibm_set_dynamic_indicator_lock and
  rtas_ibm_get_dynamic_sensor_state_lock mutex for failure cases
  as reported by Dan Carpenter
- Fixed build warnings for the proper function parameter descriptions
  as reported by kernel test robot <a class="moz-txt-link-rfc2396E" href="mailto:lkp@intel.com">&lt;lkp@intel.com&gt;</a>

Haren Myneni (7):
  powerpc/pseries: Define common functions for RTAS sequence calls
  powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls
  powerpc/pseries: Add papr-indices char driver for ibm,get-indices
  powerpc/pseries: Add ibm,set-dynamic-indicator RTAS call support
  powerpc/pseries: Add ibm,get-dynamic-sensor-state RTAS call support
  powerpc/pseries: Add papr-platform-dump character driver for dump
    retrieval
  powerpc/pseries: Add a char driver for physical-attestation RTAS

 .../userspace-api/ioctl/ioctl-number.rst      |   6 +
 arch/powerpc/include/asm/rtas.h               |   4 +
 arch/powerpc/include/uapi/asm/papr-indices.h  |  41 ++
 .../uapi/asm/papr-physical-attestation.h      |  31 ++
 .../include/uapi/asm/papr-platform-dump.h     |  15 +
 arch/powerpc/kernel/rtas.c                    |   8 +-
 arch/powerpc/platforms/pseries/Makefile       |   3 +-
 arch/powerpc/platforms/pseries/papr-indices.c | 488 ++++++++++++++++++
 .../platforms/pseries/papr-phy-attest.c       | 288 +++++++++++
 .../platforms/pseries/papr-platform-dump.c    | 411 +++++++++++++++
 .../platforms/pseries/papr-rtas-common.c      | 311 +++++++++++
 .../platforms/pseries/papr-rtas-common.h      |  61 +++
 arch/powerpc/platforms/pseries/papr-vpd.c     | 351 ++-----------
 13 files changed, 1706 insertions(+), 312 deletions(-)
 create mode 100644 arch/powerpc/include/uapi/asm/papr-indices.h
 create mode 100644 arch/powerpc/include/uapi/asm/papr-physical-attestation.h
 create mode 100644 arch/powerpc/include/uapi/asm/papr-platform-dump.h
 create mode 100644 arch/powerpc/platforms/pseries/papr-indices.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-phy-attest.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-platform-dump.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-common.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-common.h
</pre>
    </blockquote>
    <font face="monospace">Userspace tools that use these interfaces are
      displaying consistent results across old/new librtas and kernel
      combinations.
      <br>
    </font>
    <font face="monospace"><br>
      For this series:
      <br>
      Tested-by: Sathvika Vasireddy <a class="moz-txt-link-rfc2396E"
        href="mailto:sv@linux.ibm.com">&lt;sv@linux.ibm.com&gt;</a>
      <br>
    </font>
    <font face="monospace"><br>
      Thanks,
      <br>
      Sathvika
    </font><span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------nxhmRf3MqlUKCdctk9a0zSU8--


