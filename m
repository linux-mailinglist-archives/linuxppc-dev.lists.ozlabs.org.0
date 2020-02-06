Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADDC154B4E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 19:39:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48D6fq6g0fzDqb0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 05:39:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=alexey.budankov@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48D6dH2G0qzDqWm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 05:38:26 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Feb 2020 10:38:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,410,1574150400"; d="scan'208";a="279752683"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Feb 2020 10:38:22 -0800
Received: from [10.251.88.4] (abudanko-mobl.ccr.corp.intel.com [10.251.88.4])
 by linux.intel.com (Postfix) with ESMTP id D2C645803E3;
 Thu,  6 Feb 2020 10:38:15 -0800 (PST)
Subject: Re: [PATCH v6 01/10] capabilities: introduce CAP_PERFMON to kernel
 and user space
To: Stephen Smalley <sds@tycho.nsa.gov>, James Morris <jmorris@namei.org>,
 Serge Hallyn <serge@hallyn.com>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 Alexei Starovoitov <ast@kernel.org>, Will Deacon <will@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <576a6141-36d4-14c0-b395-8d195892b916@linux.intel.com>
 <a4c5da70-b6d1-b133-9b64-34e164834b03@linux.intel.com>
 <5be0f67c-17e2-7861-37f3-a0f8a82be8f0@tycho.nsa.gov>
 <1bcb4cb1-98c4-cc1a-b8e3-fd8a0e1e606f@linux.intel.com>
 <06cdca0e-65f2-b58d-a84e-5a1907aa9eb5@tycho.nsa.gov>
From: Alexey Budankov <alexey.budankov@linux.intel.com>
Organization: Intel Corp.
Message-ID: <e5d8dc64-6573-21f5-80dd-64cfbf72e13f@linux.intel.com>
Date: Thu, 6 Feb 2020 21:38:14 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <06cdca0e-65f2-b58d-a84e-5a1907aa9eb5@tycho.nsa.gov>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Andi Kleen <ak@linux.intel.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Igor Lubashev <ilubashe@akamai.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Stephane Eranian <eranian@google.com>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>, oprofile-list@lists.sf.net,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 06.02.2020 21:30, Stephen Smalley wrote:
> On 2/6/20 1:26 PM, Alexey Budankov wrote:
>>
>> On 06.02.2020 21:23, Stephen Smalley wrote:
>>> On 2/5/20 12:30 PM, Alexey Budankov wrote:
>>>>
>>>> Introduce CAP_PERFMON capability designed to secure system performance
>>>> monitoring and observability operations so that CAP_PERFMON would assist
>>>> CAP_SYS_ADMIN capability in its governing role for performance monitoring
>>>> and observability subsystems.
>>>>
>>>> CAP_PERFMON hardens system security and integrity during performance
>>>> monitoring and observability operations by decreasing attack surface that
>>>> is available to a CAP_SYS_ADMIN privileged process [2]. Providing the access
>>>> to system performance monitoring and observability operations under CAP_PERFMON
>>>> capability singly, without the rest of CAP_SYS_ADMIN credentials, excludes
>>>> chances to misuse the credentials and makes the operation more secure.
>>>> Thus, CAP_PERFMON implements the principal of least privilege for performance
>>>> monitoring and observability operations (POSIX IEEE 1003.1e: 2.2.2.39 principle
>>>> of least privilege: A security design principle that states that a process
>>>> or program be granted only those privileges (e.g., capabilities) necessary
>>>> to accomplish its legitimate function, and only for the time that such
>>>> privileges are actually required)
>>>>
>>>> CAP_PERFMON meets the demand to secure system performance monitoring and
>>>> observability operations for adoption in security sensitive, restricted,
>>>> multiuser production environments (e.g. HPC clusters, cloud and virtual compute
>>>> environments), where root or CAP_SYS_ADMIN credentials are not available to
>>>> mass users of a system, and securely unblocks accessibility of system performance monitoring and observability operations beyond root and CAP_SYS_ADMIN use cases.
>>>>
>>>> CAP_PERFMON takes over CAP_SYS_ADMIN credentials related to system performance
>>>> monitoring and observability operations and balances amount of CAP_SYS_ADMIN
>>>> credentials following the recommendations in the capabilities man page [1]
>>>> for CAP_SYS_ADMIN: "Note: this capability is overloaded; see Notes to kernel
>>>> developers, below." For backward compatibility reasons access to system
>>>> performance monitoring and observability subsystems of the kernel remains
>>>> open for CAP_SYS_ADMIN privileged processes but CAP_SYS_ADMIN capability
>>>> usage for secure system performance monitoring and observability operations
>>>> is discouraged with respect to the designed CAP_PERFMON capability.
>>>>
>>>> Although the software running under CAP_PERFMON can not ensure avoidance
>>>> of related hardware issues, the software can still mitigate these issues
>>>> following the official hardware issues mitigation procedure [2]. The bugs
>>>> in the software itself can be fixed following the standard kernel development
>>>> process [3] to maintain and harden security of system performance monitoring
>>>> and observability operations.
>>>>
>>>> [1] http://man7.org/linux/man-pages/man7/capabilities.7.html
>>>> [2] https://www.kernel.org/doc/html/latest/process/embargoed-hardware-issues.html
>>>> [3] https://www.kernel.org/doc/html/latest/admin-guide/security-bugs.html
>>>>
>>>> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>
>>>
>>> This will require a small update to the selinux-testsuite to correctly reflect the new capability requirements, but that's easy enough.
>>
>> Is the suite a part of the kernel sources or something else?
> 
> It is external,
> https://github.com/SELinuxProject/selinux-testsuite
> 
> I wasn't suggesting that your patch be blocked on updating the testsuite, just noting that it will need to be done.

Ok. Thanks!

~Alexey


