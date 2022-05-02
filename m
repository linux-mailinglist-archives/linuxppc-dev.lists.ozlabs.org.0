Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F6B517A3C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 00:54:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsdhX6KMRz3bq5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 08:54:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jnlfZk0M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jnlfZk0M; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsS0h53p1z2xCB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 01:38:12 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id e24so12992427pjt.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 May 2022 08:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=G3glF1N1lkKRH3me6ZqnttV9WJnWFWFCivroWGr8uPw=;
 b=jnlfZk0MfWr19qnX7NNM7gjFbPrAaWIfsyMT/a2rh5ffB/v2pJfbjyvAq97gGIe7rG
 uTUMZLa+nH4Wi+FN1pN2qcbvqHIR7otQfoQlalMkw87IR+nh4GjHlRC2yY+aj07x7Zne
 zGxtELORRMhqCmhbzrZiK6h4L9mSjjEbD0e/BNWv1R3qQVzAWwb6BmkzUoGpIqPCgA0+
 2ObdH2Pg4hawFfFic1Il4G3F/+ejKXGEvbg5eg2rTiwMZw7T8927WOyZTHdoi9Cab9u+
 ja/WP8lvKP5PRcbOA34iZHYDbBB8sQnBVMJ+5O9kafsYw33rMK6sYehTkd+7FNKb5q1e
 OVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G3glF1N1lkKRH3me6ZqnttV9WJnWFWFCivroWGr8uPw=;
 b=3QHd9u82drZS5NFv1taDixHiUy8DVBaXkar7Pk/Z2RbTRGEekRVXlS7LKHk+vUGvsT
 9NMoWhXXciNue8BA24mbrGCl6TYtfXKG9mZDrcEuGre3bgv2Xbzd7TZDRFRXOyP4GObz
 5FufYtKENj32XYoCVAIk7nVyrhSihBAna7I7EwlVJdunfK9uFijj39uKkguE0vwYXv9C
 5fNWbqVHQKriKYQ/8Y70WyCsDIXeg+mPT9naO2lxXROIagDdB4OPwkqLNIARhnuFRgd4
 bd2TgnkcykYtjyvZ2RiXpguBWieWvxA6HcBxCSdHTQEtRfq5OmSR1/WFeXmk0hkQVAzU
 iaxw==
X-Gm-Message-State: AOAM5316n55JY6DuW2sAQFd/+RJ+wafD6inNpLhc7ypnvNV7QjDmvHAv
 m0PHPsXw/yxDjq/fiS78N6w=
X-Google-Smtp-Source: ABdhPJz2mcdlrFcmvMvPOd4zB8ruKzEKevBlh0oNjAFvQiI4OOjKtV9AXzvbEK94SOMfNeMR9xysnA==
X-Received: by 2002:a17:903:230f:b0:15e:6e55:3230 with SMTP id
 d15-20020a170903230f00b0015e6e553230mr12264443plh.35.1651505887371; 
 Mon, 02 May 2022 08:38:07 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 ba1-20020a170902720100b0015e8d4eb1e6sm4806927plb.48.2022.05.02.08.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 08:38:06 -0700 (PDT)
Message-ID: <eaf3a893-00dd-8717-202e-911b395670e1@gmail.com>
Date: Mon, 2 May 2022 08:38:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 15/30] bus: brcmstb_gisb: Clean-up panic/die notifiers
Content-Language: en-US
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, akpm@linux-foundation.org,
 bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-16-gpiccoli@igalia.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220427224924.592546-16-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 03 May 2022 08:54:19 +1000
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
 linux-leds@vger.kernel.org, linux-s390@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, mikelley@microsoft.com,
 john.ogness@linutronix.de, corbet@lwn.net, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 dyoung@redhat.com, vgoyal@redhat.com, linux-xtensa@linux-xtensa.org,
 dave.hansen@linux.intel.com, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, coresight@lists.linaro.org,
 linux-um@lists.infradead.org, rostedt@goodmis.org, rcu@vger.kernel.org,
 bp@alien8.de, luto@kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, andriy.shevchenko@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 jgross@suse.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 kernel@gpiccoli.net, linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 kernel-dev@igalia.com, linux-alpha@vger.kernel.org, vkuznets@redhat.com,
 Brian Norris <computersforpeace@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/27/2022 3:49 PM, Guilherme G. Piccoli wrote:
> This patch improves the panic/die notifiers in this driver by
> making use of a passed "id" instead of comparing pointer
> address; also, it removes an useless prototype declaration
> and unnecessary header inclusion.
> 
> This is part of a panic notifiers refactor - this notifier in
> the future will be moved to a new list, that encompass the
> information notifiers only.
> 
> Fixes: 9eb60880d9a9 ("bus: brcmstb_gisb: add notifier handling")
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Not sure if the Fixes tag is warranted however as this is a clean up, 
and not really fixing a bug.
-- 
Florian
