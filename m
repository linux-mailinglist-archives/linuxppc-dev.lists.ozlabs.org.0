Return-Path: <linuxppc-dev+bounces-5401-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF973A16FD5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 17:07:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcFbJ52xQz2xsd;
	Tue, 21 Jan 2025 03:07:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737389228;
	cv=none; b=F+TZhyGMsdj+jUmPZTsy/WqOmUQ+U9QA/46Wc0f639b0nizb0c+3L4TP8dZn80diSxkO9VJMuuUuEIlqmaNZ85zJCLFF5TNS44lavs5Dxved6Ver+I8J/X8knel3QEjaJmkUBaYLsHg8EZXQnE6NwBigPxMjPjoj45QMttPq18KaSekWFN1rg+LJQL/Jbj21nGM90xvsmcwHfJe1tu5LABMhzQzjLtkTnj/VoC8gXyhE49Rym9DsX+HMEyqiC6DD9wEwDAN83mH+kR6+5kl8FIcpKB0WEogT7PkJQbgz5/gL22O0gGpCCYVO+KWaqYl78rbVFGCTdP3sAR/GH3I/kA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737389228; c=relaxed/relaxed;
	bh=w2kqVj/vNWaOIWjGL7Wo52uGPlsoab4Shov7lcOaDwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L62Mfc0PgH71ii5xe2nPtz2ov4DF75+l/qV07ho5r2UkTO6VXDAO/vUlmD+U6c3yTc8xFL0gR0eLhknrGGvfcZs0ynlysjoxgLG6V6mb7ppQPDAqPrQ9R6pkxrpDuSoE5GKdm/Q9axw4MYVXJYotvvwwWQXHJJ5QVqG/qI0LudnCM5pyEkXHQJmJjmGnequ9C3wDyLZg2e5qjwjuu2x+LrbOt1ak3VnpfWGim2e5AGFSwCHRQQgtv+iWYgJo29nIzHWTabVP+oLg8vBTX0yOY7sh1IS7Vk7sU0ErVQDhWkDDTI+XvkZ5H+QhuQpOZ4g0DLXNdwmXKL+uqsj3PqqwIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gI7UdyXO; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gI7UdyXO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcFbH1bpkz2xrC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 03:07:06 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-385e0e224cbso2452973f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2025 08:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737389221; x=1737994021; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w2kqVj/vNWaOIWjGL7Wo52uGPlsoab4Shov7lcOaDwM=;
        b=gI7UdyXOlDd8r3oDkMNkQzk6VYiT/qK8nND739n1wXu/BDm3ZVZgqMZU4QeU7y5K3l
         /r0qrCxcDqBOZ+GxJFHBhmgZM+xo46guJ9U3Eyj1XIUx9jelX0FI0sRnN/bI/bjn7R2p
         GabFsuCxK/wLpTHKoE5e2RfnXyvKypfBrdM4vBESOHDuDYmH+4Z0n3Zw5T+oZ3ARpFUj
         8SNhhiq+g/GVcdw/F4Sj1UKzBaENjcCkQyuzdN7cEVEFHNY5QojTMJUHujNr/4fWwEdy
         akr1ehzabfwzRhHMW2p/tEF1YigD8lk/4zjxdXnp1oLKVq/nbV9Qo3ahyYIl7JOKqdWN
         01gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737389221; x=1737994021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2kqVj/vNWaOIWjGL7Wo52uGPlsoab4Shov7lcOaDwM=;
        b=ZQMAVSIRx5/yskf0NkIsTcrVlHgUbWoMhy+HOozsheCI/OHlKegblQQhr0u1cHK9nX
         JrifC+iSgj8pHIqB5jNytsL3UgsoZ/Ty0YjMkuGynZzk1JMZH2J4pja/f4IxWafDk+Ws
         xGBijC+15fNTv9mkh3yvTKAsKtn+z4aiWREBA5ZfV/OHbqrcerm2PqORGUEjmt5mPyB+
         hq1Oc5Ai3N5SZXKGX3p2d7J2sVsWu2dJYVludOe9V+RWptW1jddYudJscpO4NthNk9Dh
         2mhn5w4MVteGmpJ+4ImvRcNk/ePTDXTzG34E0/XBFUbTgRNdAljCzfdrmIWJoWmJfTQ3
         uaJA==
X-Forwarded-Encrypted: i=1; AJvYcCX83rHH8BKNC9ETg96R2RNHv5r4jNZJz7GSGpeuG9Bq+57SwafXUj6ZS+NBkfPX1BWSCk5zkF249UGbyBM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YymF/1elZ2qUH8GeuCLRv86Bbl9OmCCIWdRBrc9C58yaHAvppfu
	SFXIJ716pcsUKS6r7RrgJFMdz/Yo1O0jcfNbIp6ypJd7Unq1zGIxMzO+j5Y0weU=
X-Gm-Gg: ASbGnctOR+b87Jwv7f0x5sCPCTYE30UJ1K5os5Lf6o5M823B1YUz4dr2lPoXinJE8le
	FFGX9KBSb26K2VRoOIqRlPQVxQf8A3a6zKye0dp+hFcZiqxm55tVu++SrqHw8Ddw+TdnZA6ujR6
	s4Hzn8EXb7PoWBoj6kg0K4yCzWw8UcRdYXI/8SwmQxWypWL1znZ5OzKU4OCR7hLekpC/Izf8ZZ8
	kqubilOz1cQ6dMIHh+FnrqHq3iUmU9hlr3qwcIWZL3B4iKWtZxplEGMtu1K2jzvj4MTH04=
X-Google-Smtp-Source: AGHT+IHblmvdT66NUAONbYDv1+zr0khDyHKPPgNGnZvOkmFzzDFs2TXnIxu6R3PeoRXgYqp5XmXoeg==
X-Received: by 2002:a05:6000:1548:b0:385:f19f:5a8f with SMTP id ffacd0b85a97d-38bf5655594mr10417912f8f.4.1737389220704;
        Mon, 20 Jan 2025 08:07:00 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c4751sm202802545e9.19.2025.01.20.08.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 08:07:00 -0800 (PST)
Date: Mon, 20 Jan 2025 17:06:58 +0100
From: Petr Mladek <pmladek@suse.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: jikos@kernel.org, mbenes@suse.cz, joe.lawrence@redhat.com,
	shuah@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] selftests: livepatch: handle PRINTK_CALLER in
 check_result()
Message-ID: <Z450ohzYtxVEMh1_@pathway.suse.cz>
References: <20250119163238.749847-1-maddy@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250119163238.749847-1-maddy@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun 2025-01-19 22:02:38, Madhavan Srinivasan wrote:
> Some arch configs (like ppc64) enable CONFIG_PRINTK_CALLER,
> which adds the caller id as part of the dmesg. With recent
> util-linux's update 467a5b3192f16 ('dmesg: add caller_id support')
> the standard "dmesg" has been enhanced to print PRINTK_CALLER fields.
> 
> Due to this, even though the expected vs observed are same,
> end testcase results are failed.
> 
>  -% insmod test_modules/test_klp_livepatch.ko
>  -livepatch: enabling patch 'test_klp_livepatch'
>  -livepatch: 'test_klp_livepatch': initializing patching transition
>  -livepatch: 'test_klp_livepatch': starting patching transition
>  -livepatch: 'test_klp_livepatch': completing patching transition
>  -livepatch: 'test_klp_livepatch': patching complete
>  -% echo 0 > /sys/kernel/livepatch/test_klp_livepatch/enabled
>  -livepatch: 'test_klp_livepatch': initializing unpatching transition
>  -livepatch: 'test_klp_livepatch': starting unpatching transition
>  -livepatch: 'test_klp_livepatch': completing unpatching transition
>  -livepatch: 'test_klp_livepatch': unpatching complete
>  -% rmmod test_klp_livepatch
>  +[   T3659] % insmod test_modules/test_klp_livepatch.ko
>  +[   T3682] livepatch: enabling patch 'test_klp_livepatch'
>  +[   T3682] livepatch: 'test_klp_livepatch': initializing patching transition
>  +[   T3682] livepatch: 'test_klp_livepatch': starting patching transition
>  +[    T826] livepatch: 'test_klp_livepatch': completing patching transition
>  +[    T826] livepatch: 'test_klp_livepatch': patching complete
>  +[   T3659] % echo 0 > /sys/kernel/livepatch/test_klp_livepatch/enabled
>  +[   T3659] livepatch: 'test_klp_livepatch': initializing unpatching transition
>  +[   T3659] livepatch: 'test_klp_livepatch': starting unpatching transition
>  +[    T789] livepatch: 'test_klp_livepatch': completing unpatching transition
>  +[    T789] livepatch: 'test_klp_livepatch': unpatching complete
>  +[   T3659] % rmmod test_klp_livepatch
> 
>   ERROR: livepatch kselftest(s) failed
>  not ok 1 selftests: livepatch: test-livepatch.sh # exit=1
> 
> Currently the check_result() handles the "[time]" removal from
> the dmesg. Enhance the check to also handle removal of "[Thread Id]"
> or "[CPU Id]".
> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>

Looks and works well:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

PS: The merge window for 6.14 has started yesterday. Every change
    should spend at least few days in linux-next and I have already
    sent a pull request so it is kind of late for 6.14.

    If there is a demand, I could still queue it for 6.14 in the 2nd
    half of the merge window or for rc2. There is only small group
    of people interested into the livepatch selftests anyway.

