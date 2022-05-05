Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 936B251CBA6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 23:54:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvSC22sgCz3byG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 07:54:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=OX97Z/D1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=OX97Z/D1; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvP2841ywz3bfg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 05:31:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=26sf2Bz2SDgQmdCQw3Y4ZTnImgJ2MyGCiyio6ZL3q3Y=; b=OX97Z/D1CJSI6hriVTxC2kAnOw
 1KITEk45cAtwCpY9rkRCDUh3KDg2O2YzMgXcmuPrqXaafenIhWWC1+LyxgtF/580Mzq9ZdOBGqQII
 szuZz7L+gnBGPa0DhyrfUrxKFOKAOdS+/7tX8dF3YT6RRRi5n+Pvq9GzAiarMSPSGIbrEUOikWcQ4
 luIwkR5QmpMMR3ULcRXOtddO+8na/Jrhq18XXAepQbZ7X+3+2omWFwgyxPBez0WA9LEkMMiNJ8gOK
 /vnX5br4i70krbeAId+z+Wo/kxx7sPLDtH+XBAxzqCS0vo9z0RVsXdy6BbySPaaEQO2JnHI7/cIaw
 LlqXpVFA==;
Received: from [179.113.53.197] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nmhB9-0009Pt-2n; Thu, 05 May 2022 21:30:24 +0200
Message-ID: <95fd6c2b-8a80-7161-953c-0660c9cc046f@igalia.com>
Date: Thu, 5 May 2022 16:28:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 08/30] powerpc/setup: Refactor/untangle panic notifiers
Content-Language: en-US
To: Hari Bathini <hbathini@linux.ibm.com>, akpm@linux-foundation.org,
 bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-9-gpiccoli@igalia.com>
 <3c34d8e2-6f84-933f-a4ed-338cd300d6b0@linux.ibm.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <3c34d8e2-6f84-933f-a4ed-338cd300d6b0@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 06 May 2022 07:52:56 +1000
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
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org, will@kernel.org,
 tglx@linutronix.de, linux-leds@vger.kernel.org, linux-s390@vger.kernel.org,
 mikelley@microsoft.com, john.ogness@linutronix.de, corbet@lwn.net,
 paulmck@kernel.org, fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 dyoung@redhat.com, vgoyal@redhat.com, linux-xtensa@linux-xtensa.org,
 dave.hansen@linux.intel.com, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org, rostedt@goodmis.org,
 rcu@vger.kernel.org, bp@alien8.de, Nicholas Piggin <npiggin@gmail.com>,
 luto@kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, andriy.shevchenko@linux.intel.com,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, linux-kernel@vger.kernel.org,
 stern@rowland.harvard.edu, senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com,
 mhiramat@kernel.org, kernel-dev@igalia.com, linux-alpha@vger.kernel.org,
 vkuznets@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/05/2022 15:55, Hari Bathini wrote:
> [...] 
> 
> The change looks good. I have tested it on an LPAR (ppc64).
> 
> Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>

Thanks a bunch Hari, much appreciated!
