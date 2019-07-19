Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5BB6E1AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 09:29:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qjLj3MFszDqsm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 17:29:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qgnv00BMzDqlJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 16:19:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45qgnt35yQz8tRt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 16:19:30 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45qgnt2jwdz9sBF; Fri, 19 Jul 2019 16:19:30 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45qgns67n5z9s7T
 for <linuxppc-dev@ozlabs.org>; Fri, 19 Jul 2019 16:19:29 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6J685ov107726
 for <linuxppc-dev@ozlabs.org>; Fri, 19 Jul 2019 02:19:27 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tu85d8rky-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 19 Jul 2019 02:19:26 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Fri, 19 Jul 2019 07:19:24 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 19 Jul 2019 07:19:21 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6J6JJeV42205314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jul 2019 06:19:20 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDA38AE053;
 Fri, 19 Jul 2019 06:19:19 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E270AE056;
 Fri, 19 Jul 2019 06:19:18 +0000 (GMT)
Received: from [9.184.183.117] (unknown [9.184.183.117])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 19 Jul 2019 06:19:18 +0000 (GMT)
Subject: Re: [PATCH v4 00/25] Add FADump support on PowerNV platform
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
Date: Fri, 19 Jul 2019 11:49:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------E8527C4F5E4B1D39FEB74B1D"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19071906-0016-0000-0000-0000029440BF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071906-0017-0000-0000-000032F2201A
Message-Id: <c03416bf-fb55-18a8-8227-bd3287a4ead0@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907190069
X-Mailman-Approved-At: Fri, 19 Jul 2019 17:26:22 +1000
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Oliver <oohall@gmail.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>,
 Stewart Smith <stewart@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------E8527C4F5E4B1D39FEB74B1D
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Sorry, I missed mentioning that this patchset is based on top of upstream kernel
plus the below patches:

   https://patchwork.ozlabs.org/patch/1123582/
    https://patchwork.ozlabs.org/patch/1123583/ <https://patchwork.ozlabs.org/patch/1123583/>

On 16/07/19 5:01 PM, Hari Bathini wrote:
> Firmware-Assisted Dump (FADump) is currently supported only on pSeries
> platform. This patch series adds support for PowerNV platform too.
>
> The first few patches refactor the FADump code to make use of common
> code across multiple platforms. Then basic FADump support is added for
> PowerNV platform. Followed by patches to honour reserved-ranges DT node
> while reserving/releasing memory used by FADump. The subsequent patch
> processes CPU state data provided by firmware to create and append core
> notes to the ELF core file and the next patch adds support to preserve
> crash data for subsequent boots (useful in cases like petitboot). The
> subsequent patches add support to export opalcore. opalcore makes
> debugging of failures in OPAL code easier. Firmware-Assisted Dump
> documentation is also updated appropriately.
>
> The patch series is tested with the latest firmware plus the below skiboot
> changes for MPIPL support:
>
>     https://patchwork.ozlabs.org/project/skiboot/list/?series=119169
>     ("MPIPL support")
>
>
> Changes in v4:
>   * Split the patches.
>   * Rebased to latest upstream kernel version.
>   * Updated according to latest OPAL changes.
>
> ---
>
> Hari Bathini (25):
>       powerpc/fadump: move internal macros/definitions to a new header
>       powerpc/fadump: move internal code to a new file
>       powerpc/fadump: Improve fadump documentation
>       pseries/fadump: move rtas specific definitions to platform code
>       pseries/fadump: introduce callbacks for platform specific operations
>       pseries/fadump: define register/un-register callback functions
>       pseries/fadump: move out platform specific support from generic code
>       powerpc/fadump: use FADump instead of fadump for how it is pronounced
>       opal: add MPIPL interface definitions
>       powernv/fadump: add fadump support on powernv
>       powernv/fadump: register kernel metadata address with opal
>       powernv/fadump: define register/un-register callback functions
>       powernv/fadump: support copying multiple kernel memory regions
>       powernv/fadump: process the crashdump by exporting it as /proc/vmcore
>       powerpc/fadump: Update documentation about OPAL platform support
>       powerpc/fadump: consider reserved ranges while reserving memory
>       powerpc/fadump: consider reserved ranges while releasing memory
>       powernv/fadump: process architected register state data provided by firmware
>       powernv/fadump: add support to preserve crash data on FADUMP disabled kernel
>       powerpc/fadump: update documentation about CONFIG_PRESERVE_FA_DUMP
>       powernv/opalcore: export /sys/firmware/opal/core for analysing opal crashes
>       powernv/fadump: Warn before processing partial crashdump
>       powernv/opalcore: provide an option to invalidate /sys/firmware/opal/core file
>       powernv/fadump: consider f/w load area
>       powernv/fadump: update documentation about option to release opalcore
>
>
>  Documentation/powerpc/firmware-assisted-dump.txt |  224 +++-
>  arch/powerpc/Kconfig                             |   23 
>  arch/powerpc/include/asm/fadump.h                |  190 ----
>  arch/powerpc/include/asm/opal-api.h              |   50 +
>  arch/powerpc/include/asm/opal.h                  |    6 
>  arch/powerpc/kernel/Makefile                     |    6 
>  arch/powerpc/kernel/fadump-common.c              |  153 +++
>  arch/powerpc/kernel/fadump-common.h              |  203 ++++
>  arch/powerpc/kernel/fadump.c                     | 1181 ++++++++--------------
>  arch/powerpc/kernel/prom.c                       |    4 
>  arch/powerpc/platforms/powernv/Makefile          |    3 
>  arch/powerpc/platforms/powernv/opal-call.c       |    3 
>  arch/powerpc/platforms/powernv/opal-core.c       |  637 ++++++++++++
>  arch/powerpc/platforms/powernv/opal-fadump.c     |  671 ++++++++++++
>  arch/powerpc/platforms/powernv/opal-fadump.h     |  154 +++
>  arch/powerpc/platforms/pseries/Makefile          |    1 
>  arch/powerpc/platforms/pseries/rtas-fadump.c     |  595 +++++++++++
>  arch/powerpc/platforms/pseries/rtas-fadump.h     |  123 ++
>  18 files changed, 3231 insertions(+), 996 deletions(-)
>  create mode 100644 arch/powerpc/kernel/fadump-common.c
>  create mode 100644 arch/powerpc/kernel/fadump-common.h
>  create mode 100644 arch/powerpc/platforms/powernv/opal-core.c
>  create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.c
>  create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.h
>  create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.c
>  create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.h
>

--------------E8527C4F5E4B1D39FEB74B1D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre>Sorry, I missed mentioning that this patchset is based on top of upstream kernel
plus the below patches:

   <a target="_blank" class="c-link" href="https://patchwork.ozlabs.org/patch/1123582/" style="box-sizing: inherit; color: rgb(18, 100, 163); text-decoration: none; font-family: Slack-Lato, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">https://patchwork.ozlabs.org/patch/1123582/</a>
<a target="_blank" class="c-link" href="https://patchwork.ozlabs.org/patch/1123583/" style="box-sizing: inherit; color: rgb(18, 100, 163); text-decoration: none; font-family: Slack-Lato, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">    https://patchwork.ozlabs.org/patch/1123583/</a>

</pre>
    <div class="moz-cite-prefix">On 16/07/19 5:01 PM, Hari Bathini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com">
      <pre class="moz-quote-pre" wrap="">Firmware-Assisted Dump (FADump) is currently supported only on pSeries
platform. This patch series adds support for PowerNV platform too.

The first few patches refactor the FADump code to make use of common
code across multiple platforms. Then basic FADump support is added for
PowerNV platform. Followed by patches to honour reserved-ranges DT node
while reserving/releasing memory used by FADump. The subsequent patch
processes CPU state data provided by firmware to create and append core
notes to the ELF core file and the next patch adds support to preserve
crash data for subsequent boots (useful in cases like petitboot). The
subsequent patches add support to export opalcore. opalcore makes
debugging of failures in OPAL code easier. Firmware-Assisted Dump
documentation is also updated appropriately.

The patch series is tested with the latest firmware plus the below skiboot
changes for MPIPL support:

    <a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/project/skiboot/list/?series=119169">https://patchwork.ozlabs.org/project/skiboot/list/?series=119169</a>
    ("MPIPL support")


Changes in v4:
  * Split the patches.
  * Rebased to latest upstream kernel version.
  * Updated according to latest OPAL changes.

---

Hari Bathini (25):
      powerpc/fadump: move internal macros/definitions to a new header
      powerpc/fadump: move internal code to a new file
      powerpc/fadump: Improve fadump documentation
      pseries/fadump: move rtas specific definitions to platform code
      pseries/fadump: introduce callbacks for platform specific operations
      pseries/fadump: define register/un-register callback functions
      pseries/fadump: move out platform specific support from generic code
      powerpc/fadump: use FADump instead of fadump for how it is pronounced
      opal: add MPIPL interface definitions
      powernv/fadump: add fadump support on powernv
      powernv/fadump: register kernel metadata address with opal
      powernv/fadump: define register/un-register callback functions
      powernv/fadump: support copying multiple kernel memory regions
      powernv/fadump: process the crashdump by exporting it as /proc/vmcore
      powerpc/fadump: Update documentation about OPAL platform support
      powerpc/fadump: consider reserved ranges while reserving memory
      powerpc/fadump: consider reserved ranges while releasing memory
      powernv/fadump: process architected register state data provided by firmware
      powernv/fadump: add support to preserve crash data on FADUMP disabled kernel
      powerpc/fadump: update documentation about CONFIG_PRESERVE_FA_DUMP
      powernv/opalcore: export /sys/firmware/opal/core for analysing opal crashes
      powernv/fadump: Warn before processing partial crashdump
      powernv/opalcore: provide an option to invalidate /sys/firmware/opal/core file
      powernv/fadump: consider f/w load area
      powernv/fadump: update documentation about option to release opalcore


 Documentation/powerpc/firmware-assisted-dump.txt |  224 +++-
 arch/powerpc/Kconfig                             |   23 
 arch/powerpc/include/asm/fadump.h                |  190 ----
 arch/powerpc/include/asm/opal-api.h              |   50 +
 arch/powerpc/include/asm/opal.h                  |    6 
 arch/powerpc/kernel/Makefile                     |    6 
 arch/powerpc/kernel/fadump-common.c              |  153 +++
 arch/powerpc/kernel/fadump-common.h              |  203 ++++
 arch/powerpc/kernel/fadump.c                     | 1181 ++++++++--------------
 arch/powerpc/kernel/prom.c                       |    4 
 arch/powerpc/platforms/powernv/Makefile          |    3 
 arch/powerpc/platforms/powernv/opal-call.c       |    3 
 arch/powerpc/platforms/powernv/opal-core.c       |  637 ++++++++++++
 arch/powerpc/platforms/powernv/opal-fadump.c     |  671 ++++++++++++
 arch/powerpc/platforms/powernv/opal-fadump.h     |  154 +++
 arch/powerpc/platforms/pseries/Makefile          |    1 
 arch/powerpc/platforms/pseries/rtas-fadump.c     |  595 +++++++++++
 arch/powerpc/platforms/pseries/rtas-fadump.h     |  123 ++
 18 files changed, 3231 insertions(+), 996 deletions(-)
 create mode 100644 arch/powerpc/kernel/fadump-common.c
 create mode 100644 arch/powerpc/kernel/fadump-common.h
 create mode 100644 arch/powerpc/platforms/powernv/opal-core.c
 create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.c
 create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.h
 create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.c
 create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.h

</pre>
    </blockquote>
  </body>
</html>

--------------E8527C4F5E4B1D39FEB74B1D--

