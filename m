Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F8B154B30
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 19:33:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48D6W43chYzDqWY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 05:33:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=tycho.nsa.gov (client-ip=214.24.27.198;
 helo=updc19pa23.eemsg.mail.mil; envelope-from=sds@tycho.nsa.gov;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=tycho.nsa.gov
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=tycho.nsa.gov header.i=@tycho.nsa.gov header.a=rsa-sha256
 header.s=tycho.nsa.gov header.b=czxS3H7t; 
 dkim-atps=neutral
X-Greylist: delayed 77 seconds by postgrey-1.36 at bilbo;
 Fri, 07 Feb 2020 05:31:34 AEDT
Received: from UPDC19PA23.eemsg.mail.mil (UPDC19PA23.eemsg.mail.mil
 [214.24.27.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48D6TL3fTlzDqVn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 05:31:30 +1100 (AEDT)
X-EEMSG-check-017: 55929116|UPDC19PA23_ESA_OUT05.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.70,410,1574121600"; d="scan'208";a="55929116"
Received: from emsm-gh1-uea11.ncsc.mil ([214.29.60.3])
 by UPDC19PA23.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 06 Feb 2020 18:30:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
 s=tycho.nsa.gov; t=1581013805; x=1612549805;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=GIuxHJNaxkFgGYFU+0k1ATkzz7KYxG6sstbiSLNyjtA=;
 b=czxS3H7tDzxz3LzjylHylJdD0dL3P1TQ5ebuOvGfMW/bfHLLhkZ0DXxj
 8uV0r2xkzgsLY7bWnX5hkDTmh6VEb2fX/TBbNO6Lp4YLU7k5XRj3fa2uQ
 uyVKGSxvE+YCKgcnUXNzILN/bHXuS29MAI3oe8cKLAXD53FYY2a/ZwWOu
 rvH+1tLdSomHeEK9UFi0zccW8n9qgGIKwCjdoXwRJasYeRH23V+YqEkWZ
 K+8DRXLdx5W4Z1M600G++rupuQ3o7i93PJeQuGEBj7PARjyTjwAhlYjDY
 uoHGhaVisZVSzeDaiJx0ediZFC2y7835yPeJbRq2tRXKA0wf+paJSGT9t Q==;
X-IronPort-AV: E=Sophos;i="5.70,410,1574121600"; d="scan'208";a="38773436"
IronPort-PHdr: =?us-ascii?q?9a23=3ArKBTTR+HdHScVP9uRHKM819IXTAuvvDOBiVQ1K?=
 =?us-ascii?q?B91OkfIJqq85mqBkHD//Il1AaPAdyHra8fwLOP6+igATVGvc/a9ihaMdRlbF?=
 =?us-ascii?q?wssY0uhQsuAcqIWwXQDcXBSGgEJvlET0Jv5HqhMEJYS47UblzWpWCuv3ZJQk?=
 =?us-ascii?q?2sfQV6Kf7oFYHMks+5y/69+4HJYwVPmTGxfa5+IA+5oAnMucQam4tvJ6g+xh?=
 =?us-ascii?q?fUv3dEZ/ldyWd0KV6OhRrx6dq88ZB5/yhMp/4t8tNLXLnncag/UbFWFiktPX?=
 =?us-ascii?q?ov5M3suxnDTA+P6WUZX24LjBdGABXL4Q/jUJvpvST0quRy2C+BPc3rVr80Qi?=
 =?us-ascii?q?it771qSBDzligKMSMy/XzNhcxxiKJbpw+hpwB6zoXJboyZKOZyc6XAdt4BW2?=
 =?us-ascii?q?FPQtheWDBAAoOkbosAEewBPfpDr4Lgo1cCtAayCRWwCO/qzDJHiGX23akn2O?=
 =?us-ascii?q?o/Fw/I0hErE9YXvHjKqNj5MaEfWv23wqbV1zXOd+5Y1ynz6IbIcR4vr/+DUr?=
 =?us-ascii?q?1yfsXNxkciDB/Fg1eKpID5Iz+Y2OYAvm6G5ORgT+KvjGsnphlsrDiz2Mgsko?=
 =?us-ascii?q?nJiZwTylvZ6Ct5xZw6Jdm8SEFlYd+vDZxdtzqHOIttWc4iX2Fptzo6yr0Bo5?=
 =?us-ascii?q?K7ejMKx449yx7QbPyHbZGF7xT+X+ifJjd4gWhqeLO5hxuq8kiv1Pf8Vs+q31?=
 =?us-ascii?q?ZOtCZFlcPMtn8V2xzc68iHVvt9/lq61jqVyw/T7eRELVgxlaXBLZ4swKQ8lp?=
 =?us-ascii?q?0JsUTMGCL9hUb4jLeOe0k59eWl5P7rb7X7qpOGKYN5hR/yPr4zlsG5HO82KB?=
 =?us-ascii?q?IBX3KB9uS5zLDj+Er5T6hUgfAuianZtYzaJdwcpq6kHw9ZyoYj5Ai7DzehyN?=
 =?us-ascii?q?kYgWMILEhEeBKalIjlIVDOIPb2Dfe4mFSjjitky+raPrzhHprNLn/DnK3nfb?=
 =?us-ascii?q?lh8E5T1BA/zdVe55JQEr0BIfTzVVHttNHAExM0PAO5z/znBdlgzI8SR22CDr?=
 =?us-ascii?q?GDPK/PqVOI4/ggI+iIZI8bojb9LP0l6ub1jXAkgl8QZrWp3JsLZ3C4GfRqOU?=
 =?us-ascii?q?OZYWH2jdsbHmcKuRQ+QPTwiFKeST5Te2qyX6Uk6z4hDIKpE4jCSZ6tgbCbxy?=
 =?us-ascii?q?i7A4BZaXpAClCPFnfoaZ6JW/MNaCKUP89gnSYIVbmnS489yx6usBX2xKZgLu?=
 =?us-ascii?q?rR4icYr47s1MBp5+3PkhE/7T50D8Ga02GXVWF0n3gISiQw3K9lpExy1FaD3b?=
 =?us-ascii?q?J/g/xCGtxZ/+lJXRsiNZ7A0+x6DMj/WhnfcdeTR1apXM6rATErQdI1x98PY0?=
 =?us-ascii?q?B9F8++gRDE2iqgG6UVmKCTBJwo7qLc2GD8J95jxHbayqYhlVgnT9BONW2giK?=
 =?us-ascii?q?5/7RLcCJPXnEqDiqmmb6Mc3DTC9G2b12qBoFlYUBJsUaXCRX0QfFfZrdHn6U?=
 =?us-ascii?q?7ZTL+hF64nMg1fxs6GMKdKbcfpjVpeTvf5JNvee36xm3u3BRuQw7OMbYzqe2?=
 =?us-ascii?q?oa3CjGEkgLjR0c/XacOggiHCuuv2XeDDl2H1L1f0zs6fV+qG+8TkIszQGKaE?=
 =?us-ascii?q?ph17yv9R4On/CcT+kc3rIYuCcgrTV7AlC90snSC9qBoQphYapdbck84FdByW?=
 =?us-ascii?q?LWqQh9Moa8IKBlg14Uax53sF/21xVrFoVAltAno2kxzApuMq+Y001Odyme3Z?=
 =?us-ascii?q?/uPr3bMG7y/Aqga6TOwFHRzM6W+rsT6PQ/s1jisgCpFk4m83h80NlazWGc5p?=
 =?us-ascii?q?PUAwoWS57xVVw39xdirbHAfiY9/5/U1WFrMaSsqj/Nwc8pBO84yha7ZNpfK7?=
 =?us-ascii?q?mLFArpHMIAHcSuL/Yqm1exZBIeIO9S7LI0P9+hd/ae3a6rJPhvkSm4gmRD5I?=
 =?us-ascii?q?ByzFiM9y9mRe7OxZoFwuyX0hGdWDfhlF2hqNz4mZhYZTEOGWqy0TLrBI1Ka6?=
 =?us-ascii?q?12fIYLD3quIsKtytV/gZ7tR2BX9Fq5C1wa38+pfAKYb0bh0g1IyUQXvXunlD?=
 =?us-ascii?q?Okzzx7lzEoobGS3CjPw+TkaRoHJnRLRG5kjVftLom4lc0VU1awZQgziBSl/V?=
 =?us-ascii?q?r6x7RcpKlnMWbTW11Hfy73L254VKu9rbWCY8lI6JMntSVYTv6wbkydSr74ux?=
 =?us-ascii?q?EayT/sH3NCxDAncDGnopT5nxhniG2GNnlzt3rZdt9ryBjF59zTX/tR0SAHRC?=
 =?us-ascii?q?VilTbXAV28NcGz/dqIj5fDrvy+V2W5W51RdinryZiAuzGg6G1wHxKwgvCzlc?=
 =?us-ascii?q?f7EQQgzSD70NxqXz3SrBngeonry7i6MeV/c0lsBV/87dd6G45nnoszmp4Qw3?=
 =?us-ascii?q?4aiYuR/Xccj2fzPstU2bjkYHoOWzEL2djV7xbh2EF5KXKJ3Y35XG2HwsR9f9?=
 =?us-ascii?q?m6fn8W2iUl4sBLDqeU8KJLnS9srlq3owLQbuNwnjMcyfs19H4amPsFuAQ3zi?=
 =?us-ascii?q?qDHL8dAFdXPTfvlxSU6NC+tL9bZGG1cbi/zEB+h8yuDKmeogFAX3b0YpMiHS?=
 =?us-ascii?q?527sViP1PAyWbz5Z/4d9nNd9ITtwGUkhfZg+hQL5I+i+cKhS55Nm/mo30lxP?=
 =?us-ascii?q?A0jQZ00ZG5ooeHMWNt87y9AhJCMT31fcwT8Cn3jalChsaWw5yvHpJ5FzUQQp?=
 =?us-ascii?q?ToSfOoEDQPtfXoLAuODjI8pWmBGbbFHg+Q9l1mr3TRHJCvLX2XI2MZzdp6Th?=
 =?us-ascii?q?mHOENfmBwUXCk9npMhEgCqxcrhcFp25zwI/FH4sB5MxvtrNxbhSGffohmnaj?=
 =?us-ascii?q?MvRZibLRpW9R1C51zPPcyf6OJzETtY8Ye8owOTMGOUeh5EDWYTWkyLH1rjJK?=
 =?us-ascii?q?Wh5cHc8+iEAeqzN//OYbSIqexDWPaI3Yqv3Zd/8zmRKMqPIGJvD/k62kpYQX?=
 =?us-ascii?q?B5AN7VmzIOSiwTjS3CdNWbqA27+i1tocC16O7rVx735YuTF7tSNs1i+xS3ga?=
 =?us-ascii?q?eFKu6Riz91KS5C2ZMWxH/I06QQ0UUMiyFhaTatC64MtS3TQ6LKnK9YERobZz?=
 =?us-ascii?q?l0NMtS4KI2xhNNNtLDitPpyr54ieY4C1BdVVz7ncGpa80KI2WjO1/eAEaLNa?=
 =?us-ascii?q?+GJSHQzsHzYKO8UqFQjP5Oux2rtzaXCUnjMSqfl2qhaxf6GOVBnCyKdDZDtI?=
 =?us-ascii?q?i7cRFzQTzqSN/2Zwz9OsJ7hDs1xqMcgnLMKH5aMD5gfkcLpbqVu2cQoPx6Fn?=
 =?us-ascii?q?cJy31/N+if03Kb6u7CMJcNmf1iByl10eVA7yJ+g4BY9i5JDNx8nC/DqJY6uF?=
 =?us-ascii?q?y8neSnyjNjVAtI7D1MgdTP9X1vJajDvqtBW3Lf4AgEpTGIBggHvclNC9vhoa?=
 =?us-ascii?q?lcx9HD0qXpJ2EGu/vO+8IYC8+cA8udLnMlMR2hFDOcKQYBSnb/PGraimRene?=
 =?us-ascii?q?uU+3nTqYI1/NykuZwBTfd+U1gzH+lSXkFkGtMFCI16UjMtjfiQi8teoTL0rh?=
 =?us-ascii?q?7WQsxB+JTOVu6TB/jpADKYi6RUIRoO3b78a48UM8ezj05lbV9zh8LOEkrMXN?=
 =?us-ascii?q?ZApAVlbwkpsANM9mRzSis43EezLkuE5HIDGP/8pQI/kAxgZuUx8ymkt14sOn?=
 =?us-ascii?q?LJqTE2nU13ns/q13TZTz/1KO+cUIhdDCy841cwNpfTQAtvawC220t+O2GAD4?=
 =?us-ascii?q?pYkr8oUGlgiwLGo5JUUapERLBAfQQ43viSbfxu1k5T/GHv4E5M5eLIDdNPkA?=
 =?us-ascii?q?8na5ulqToU3hpuRNMxIaHKIaNPiFlcwKuT6HyGzOc0lTQCKl4N/WXaQysBvE?=
 =?us-ascii?q?gFJ/FyPCaz1vB94gyF3T1YcS4DUOR88aEizV80J+nVl3Go6LVEME3kcrXFfq?=
 =?us-ascii?q?4=3D?=
X-IPAS-Result: =?us-ascii?q?A2DvAgACWjxe/wHyM5BmHAEBAQEBBwEBEQEEBAEBgXuBf?=
 =?us-ascii?q?YEYVSASKoQViQOGYQEBAQEBAQaBN4lwkUsJAQEBAQEBAQEBLQoBAYFMgi9FA?=
 =?us-ascii?q?oJhOBMCEAEBAQQBAQEBAQUDAQFshTcMgjspAYMCAQUjFS0UEAsYAgImAgJXB?=
 =?us-ascii?q?gEMBgIBAYJjPwGCViUPrSiBMoRJQUCDVYE+gQ4qiVqCY3mBB4E4D4JdPoJkA?=
 =?us-ascii?q?QEBAQKEcYJeBJAchyJGl2eCRIJOhHyOdgYbgkh4l0stjjWBS4chlEgigVgrC?=
 =?us-ascii?q?AIYCCEPgycJFjEYDY5VgzuFFIUIAVQjAzACBQaOPQEB?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil)
 ([144.51.242.1])
 by emsm-gh1-uea11.NCSC.MIL with ESMTP; 06 Feb 2020 18:30:02 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
 by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id
 016IT9Ng204923; Thu, 6 Feb 2020 13:29:09 -0500
Subject: Re: [PATCH v6 01/10] capabilities: introduce CAP_PERFMON to kernel
 and user space
To: Alexey Budankov <alexey.budankov@linux.intel.com>,
 James Morris <jmorris@namei.org>, Serge Hallyn <serge@hallyn.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 Alexei Starovoitov <ast@kernel.org>, Will Deacon <will@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <576a6141-36d4-14c0-b395-8d195892b916@linux.intel.com>
 <a4c5da70-b6d1-b133-9b64-34e164834b03@linux.intel.com>
 <5be0f67c-17e2-7861-37f3-a0f8a82be8f0@tycho.nsa.gov>
 <1bcb4cb1-98c4-cc1a-b8e3-fd8a0e1e606f@linux.intel.com>
From: Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <06cdca0e-65f2-b58d-a84e-5a1907aa9eb5@tycho.nsa.gov>
Date: Thu, 6 Feb 2020 13:30:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1bcb4cb1-98c4-cc1a-b8e3-fd8a0e1e606f@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 2/6/20 1:26 PM, Alexey Budankov wrote:
> 
> On 06.02.2020 21:23, Stephen Smalley wrote:
>> On 2/5/20 12:30 PM, Alexey Budankov wrote:
>>>
>>> Introduce CAP_PERFMON capability designed to secure system performance
>>> monitoring and observability operations so that CAP_PERFMON would assist
>>> CAP_SYS_ADMIN capability in its governing role for performance monitoring
>>> and observability subsystems.
>>>
>>> CAP_PERFMON hardens system security and integrity during performance
>>> monitoring and observability operations by decreasing attack surface that
>>> is available to a CAP_SYS_ADMIN privileged process [2]. Providing the access
>>> to system performance monitoring and observability operations under CAP_PERFMON
>>> capability singly, without the rest of CAP_SYS_ADMIN credentials, excludes
>>> chances to misuse the credentials and makes the operation more secure.
>>> Thus, CAP_PERFMON implements the principal of least privilege for performance
>>> monitoring and observability operations (POSIX IEEE 1003.1e: 2.2.2.39 principle
>>> of least privilege: A security design principle that states that a process
>>> or program be granted only those privileges (e.g., capabilities) necessary
>>> to accomplish its legitimate function, and only for the time that such
>>> privileges are actually required)
>>>
>>> CAP_PERFMON meets the demand to secure system performance monitoring and
>>> observability operations for adoption in security sensitive, restricted,
>>> multiuser production environments (e.g. HPC clusters, cloud and virtual compute
>>> environments), where root or CAP_SYS_ADMIN credentials are not available to
>>> mass users of a system, and securely unblocks accessibility of system performance monitoring and observability operations beyond root and CAP_SYS_ADMIN use cases.
>>>
>>> CAP_PERFMON takes over CAP_SYS_ADMIN credentials related to system performance
>>> monitoring and observability operations and balances amount of CAP_SYS_ADMIN
>>> credentials following the recommendations in the capabilities man page [1]
>>> for CAP_SYS_ADMIN: "Note: this capability is overloaded; see Notes to kernel
>>> developers, below." For backward compatibility reasons access to system
>>> performance monitoring and observability subsystems of the kernel remains
>>> open for CAP_SYS_ADMIN privileged processes but CAP_SYS_ADMIN capability
>>> usage for secure system performance monitoring and observability operations
>>> is discouraged with respect to the designed CAP_PERFMON capability.
>>>
>>> Although the software running under CAP_PERFMON can not ensure avoidance
>>> of related hardware issues, the software can still mitigate these issues
>>> following the official hardware issues mitigation procedure [2]. The bugs
>>> in the software itself can be fixed following the standard kernel development
>>> process [3] to maintain and harden security of system performance monitoring
>>> and observability operations.
>>>
>>> [1] http://man7.org/linux/man-pages/man7/capabilities.7.html
>>> [2] https://www.kernel.org/doc/html/latest/process/embargoed-hardware-issues.html
>>> [3] https://www.kernel.org/doc/html/latest/admin-guide/security-bugs.html
>>>
>>> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>
>>
>> This will require a small update to the selinux-testsuite to correctly reflect the new capability requirements, but that's easy enough.
> 
> Is the suite a part of the kernel sources or something else?

It is external,
https://github.com/SELinuxProject/selinux-testsuite

I wasn't suggesting that your patch be blocked on updating the 
testsuite, just noting that it will need to be done.
