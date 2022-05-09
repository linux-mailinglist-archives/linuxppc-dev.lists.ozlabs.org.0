Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECDA5209CB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 02:02:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kxyrt2XrCz3dx3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 10:02:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=suzuki.poulose@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KxmVm6PgWz2yb9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 02:15:43 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD7641480;
 Mon,  9 May 2022 09:15:08 -0700 (PDT)
Received: from [10.57.1.248] (unknown [10.57.1.248])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15C183F73D;
 Mon,  9 May 2022 09:14:59 -0700 (PDT)
Message-ID: <d9ec6f31-6125-0723-b7d7-5898abeb3289@arm.com>
Date: Mon, 9 May 2022 17:14:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH 09/30] coresight: cpu-debug: Replace mutex with
 mutex_trylock on panic notifier
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, akpm@linux-foundation.org,
 bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-10-gpiccoli@igalia.com>
 <3cafe4fd-8a0b-2633-44a3-2995abd6c38c@arm.com>
 <65f24bc5-2211-0139-ee12-b2608e81ceb1@igalia.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <65f24bc5-2211-0139-ee12-b2608e81ceb1@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 10 May 2022 09:58:00 +1000
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
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com,
 gregkh@linuxfoundation.org, peterz@infradead.org,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 sparclinux@vger.kernel.org, will@kernel.org, tglx@linutronix.de,
 linux-leds@vger.kernel.org, linux-s390@vger.kernel.org, mikelley@microsoft.com,
 john.ogness@linutronix.de, corbet@lwn.net, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 dyoung@redhat.com, vgoyal@redhat.com, Mike Leach <mike.leach@linaro.org>,
 linux-xtensa@linux-xtensa.org, dave.hansen@linux.intel.com,
 keescook@chromium.org, arnd@arndb.de, linux-pm@vger.kernel.org,
 coresight@lists.linaro.org, Leo Yan <leo.yan@linaro.org>,
 linux-um@lists.infradead.org, rostedt@goodmis.org, rcu@vger.kernel.org,
 bp@alien8.de, luto@kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, andriy.shevchenko@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 jgross@suse.com, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org, kernel@gpiccoli.net,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 kernel-dev@igalia.com, linux-alpha@vger.kernel.org, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

On 09/05/2022 14:09, Guilherme G. Piccoli wrote:
> On 28/04/2022 05:11, Suzuki K Poulose wrote:
>> Hi Guilherme,
>>
>> On 27/04/2022 23:49, Guilherme G. Piccoli wrote:
>>> The panic notifier infrastructure executes registered callbacks when
>>> a panic event happens - such callbacks are executed in atomic context,
>>> with interrupts and preemption disabled in the running CPU and all other
>>> CPUs disabled. That said, mutexes in such context are not a good idea.
>>>
>>> This patch replaces a regular mutex with a mutex_trylock safer approach;
>>> given the nature of the mutex used in the driver, it should be pretty
>>> uncommon being unable to acquire such mutex in the panic path, hence
>>> no functional change should be observed (and if it is, that would be
>>> likely a deadlock with the regular mutex).
>>>
>>> Fixes: 2227b7c74634 ("coresight: add support for CPU debug module")
>>> Cc: Leo Yan <leo.yan@linaro.org>
>>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
>>> Cc: Mike Leach <mike.leach@linaro.org>
>>> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
>>
>> How would you like to proceed with queuing this ? I am happy
>> either way. In case you plan to push this as part of this
>> series (I don't see any potential conflicts) :
>>
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Hi Suzuki, some other maintainers are taking the patches to their next
> branches for example. I'm working on V2, and I guess in the end would be
> nice to reduce the size of the series a bit.
> 
> So, do you think you could pick this one for your coresight/next branch
> (or even for rc cycle, your call - this is really a fix)?
> This way, I won't re-submit this one in V2, since it's gonna be merged
> already in your branch.

I have queued this to coresight/next.

Thanks
Suzuki
