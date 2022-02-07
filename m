Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 900614AB3B3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 06:38:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsZgw2fTDz3bT0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 16:38:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.49; helo=mail-wr1-f49.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsZgP41bhz2xX8
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Feb 2022 16:38:23 +1100 (AEDT)
Received: by mail-wr1-f49.google.com with SMTP id s18so22626121wrv.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Feb 2022 21:38:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=byr958ymnG7EGtbbRHy8FEsvmnA+OZjvX3uXRPh6Z4E=;
 b=Bxa5V3IwEM7A+U6iJ6xltIZY0fATG318Rky7FshzT2V9KWMViWsqjwHtSDOhYNJXtx
 ouamvDE01snm0FXRH+fMFKvuGZA+e2s8ULzJOZBiVGgxN4OxMa2juvTUqDzxPlSqOdEy
 1S9a4HVHH/gdH1Tz3Hu1MgGitzSbYYPu9z54SQoseOnFZkJt+6oaF2+X3DaWvPVFGlM8
 RfB+bo+0CGT53ZXNIbAo5RO4O5IIATuEtdDjtlRNCASnczrY3lji0e8XKPpeDB+BBq+K
 bia6V97Uw54v5XY2/TSN7ynghTSBEBK0hDnFn8x9uUg9ksw15CidDwYGnRhZoJPNlgsI
 E3AQ==
X-Gm-Message-State: AOAM533dX5DFAZMvREdgUfHLRl5NRME9aQMoJLH3QnY6TTOmzwjBpGbs
 9gjYT28qg1ubKq+lsZQxthk=
X-Google-Smtp-Source: ABdhPJwPLsGKwDunoy8I0Myez3SxQ6VYLq3bfG33of6vYqoVy/EKGY4dAvht6XnNrJZEz+OnSQ488A==
X-Received: by 2002:adf:d1c6:: with SMTP id b6mr8399158wrd.669.1644212299712; 
 Sun, 06 Feb 2022 21:38:19 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id f14sm8693006wmq.40.2022.02.06.21.38.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 21:38:18 -0800 (PST)
Message-ID: <35f29dbd-04ec-037e-007c-7a079caf0d5b@kernel.org>
Date: Mon, 7 Feb 2022 06:38:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/3] vstatus: Display an informational message when the
 VSTATUS character is pressed or TIOCSTAT ioctl is called.
Content-Language: en-US
To: Walt Drummond <walt@drummond.us>, agordeev@linux.ibm.com, arnd@arndb.de,
 benh@kernel.crashing.org, borntraeger@de.ibm.com, chris@zankel.net,
 davem@davemloft.net, gregkh@linuxfoundation.org, hca@linux.ibm.com,
 deller@gmx.de, ink@jurassic.park.msu.ru,
 James.Bottomley@HansenPartnership.com, mattst88@gmail.com,
 jcmvbkbc@gmail.com, mpe@ellerman.id.au, paulus@samba.org, rth@twiddle.net,
 dalias@libc.org, tsbogend@alpha.franken.de, gor@linux.ibm.com,
 ysato@users.osdn.me
References: <20220206154856.2355838-1-walt@drummond.us>
 <20220206154856.2355838-4-walt@drummond.us>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220206154856.2355838-4-walt@drummond.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, ar@cs.msu.ru,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06. 02. 22, 16:48, Walt Drummond wrote:
> When triggered by pressing the VSTATUS key or calling the TIOCSTAT
> ioctl, the n_tty line discipline will display a message on the user's
> tty that provides basic information about the system and an
> 'interesting' process in the current foreground process group, eg:
> 
>    load: 0.58  cmd: sleep 744474 [sleeping] 0.36r 0.00u 0.00s 0% 772k
> 
> The status message provides:
>   - System load average
>   - Command name and process id (from the perspective of the session)
>   - Scheduler state
>   - Total wall-clock run time
>   - User space run time
>   - System space run time
>   - Percentage of on-cpu time
>   - Resident set size
> 
> The message is only displayed when the tty has the VSTATUS character
> set, the local flags ICANON and IEXTEN are enabled and NOKERNINFO is
> disabled; it is always displayed when TIOCSTAT is called regardless of
> tty settings.
> 
> Signed-off-by: Walt Drummond <walt@drummond.us>
> ---

It looks like my comments were addressed. However you did not document 
the chances since v1 here. IOW, [v2] tag missing here.

And please add the CCs I added last time, so that relevant people still 
can comment.

thanks,
-- 
js
suse labs
