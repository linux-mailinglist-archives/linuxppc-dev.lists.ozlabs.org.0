Return-Path: <linuxppc-dev+bounces-6807-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7237A56D87
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 17:24:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8Wnb2NsVz3cDh;
	Sat,  8 Mar 2025 03:24:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741364643;
	cv=none; b=MJoBlD1vewdIHPEh3uvthz4T96Zp25ETzMin/pWHNqrne9AtlC+I9FvlvJIlfZOkZc/bpfZzFLwpw77G1sNezuFFBpSYcaQmqsjCP/jdqADuxomhIM1Mt6Ki0HIkZ4LrfPNfT3Iol2lhz512jQZvWBgbNlKMvOfCjpKGhzOlf3T5Txp7ba+YisBfbB2v+h9tzHfpc1i0eJRPitN9UNfLB9TEmB/QSazLCfy2Eul/g8rFzgSou0RI1ZlvKs41pdQ1ttkAcxMYcwU4oenbm3Qn/FWVDQgrjhBnkCPGeI838KmrGQvEQCD/7vc43fnCc63Ya6i4Q11YzVHx85JhyITZow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741364643; c=relaxed/relaxed;
	bh=qFC22TuZGe+bG1f5l5pg/Qemq+Rum0/SnOpCdO9V/4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbMTs8YaNNWmKn4ygNk48KeZK/LWx+BLvNKa9BUc20MvYy/POX5y0jtYnhHU6LCDwUBfZXqZiwoHHItCyergLkftbev7ZqTU2lcv/hIZQgCOHTpaQVtl1p5uMUwXAkIVxpMc90LoXxi8w5KTbb0iMjdDwUh1GAU4+urrZHquHVJLMN1T7iw9aM6PoatXWiDEnS8B6MVIuFAAP24RV02qxWtcTtb9hjaD6F//FnKlxzOn15A02nFICIszIWuGgu0CDNTOk+kmMJyc7p6v0ePngxNOB+m33TXZfiHnEkQkD31N/I2l9gsQtxbprighUOOzA58NBqzAn3ef8jDvAxZ3xQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DYIPU04Q; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DYIPU04Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8WnZ04HMz301n
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 03:24:01 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39130ee05b0so1056927f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Mar 2025 08:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741364638; x=1741969438; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qFC22TuZGe+bG1f5l5pg/Qemq+Rum0/SnOpCdO9V/4E=;
        b=DYIPU04QuAu0YbKWMd9/ggiTP1e3V6W8Z6157vwiIPahHzhr9Wx5GnNjNVLXD+rTfF
         K3LrlWlQr1AEDOenQaBNHuMNm69jvO+ykf+oPFwv/b5LQuuWLvs1QvAnDdlaPpMb6xCE
         RXeyndf8OFyfyO/M4zk1lKk95W3FgsCYoF6Oqe7a3sfrlW6Co5q7KK9Wywsrnq0cTqLN
         M15mcKun+oj7ulWvDmHUd2NpZTNQMeTXRfh+yCSW5vuvkJnmDK4axojT16BTYqhV5DBi
         5EIQIgZ3NNRdh/XqCVnapByruAciy99XJOiwLeh1/f+wn4ejoi2uuFTsi+5IuPVO7gLo
         vT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364638; x=1741969438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFC22TuZGe+bG1f5l5pg/Qemq+Rum0/SnOpCdO9V/4E=;
        b=ZGH6xychOunicnHIhY0KdpuJD0IA8wATY9bH3wD3Yr8QR9AJayD8HNoH8c6OAWSMnP
         hEFgHcDPqQ5264UPgpYZO5qf3EhjZm9FC2Bd3O93xG3rbYuzoVJlVlSxIrbRtm8E9qQB
         AmQlShrdlWQgVN0QUzC7gSnfwJ3JV+qxVEDhgKtnPVS05VxprdL4S39NqPzFAPD0U4/1
         oPPI3B4hLp4e1lraWoMVriyKbwim/LYT9u5zhr9PvfCgO7xSzk3A0Ze2EHNS0H4REJOE
         xgdtVrzPMLuWz9cZ2zFJS27FQ4Dw/NGuozcU6tRzHOfAiZ7SkBJkNKnX3POWeBt+Vc/C
         DA+w==
X-Forwarded-Encrypted: i=1; AJvYcCWbracFLFFYWsMSW7g0rW4l7X+spvE2uo0wLOCvAsiT0XG8KQoTF2Pfps6EvkK5Wocytamf4c8KexyFabw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzksgmlo+AwuTHPiYCpq4BpEriatzNp6MllJ895+BrO1qZ+w+XP
	+WimzJRrRw5MbD4bd+t9hHCl8a7KnY21VFovbj1dTgQyUzpEEKqLj8fmwj/RyCYDF4MXG4OUiWF
	B
X-Gm-Gg: ASbGncs/u9/NtP7YYnJ/Csqm1m2XFakvIBbi9uUPw2KLTU1kpYoL8fEcn/mjdYVDaxl
	HIyfU/AQm1nXX3woL82EKhO0jAjsOI29jhJ/ce2SynDCgC16ushhPEdGXP5Tjj7rdC9N4qOIPlo
	jbIoJ/mwsbdAN3g3VEk6ALmJjgjWbVGCrktxFYIFLBbA73Z3Ri/Z+nJ15CwTvacygiQcrizp9Dm
	vGrMK05Xv1eyIxnvS9ZrRJCFnb8AYoAj9WxNOuIYtJ/KYgb59m2io3nPA5Kl/TkXznlIWRVpBvA
	67VfyJcfUMmdfhsGt8zN35LQuEmnCeQCOum8h43lSbHT5Vw=
X-Google-Smtp-Source: AGHT+IHn0r2Cn/E3lALMkI80pL0QtaTbm6Rd+OGBd1NolTMQ0z7qv14g2CG0Lk8XXwV55vp2Eib2dA==
X-Received: by 2002:a5d:64ed:0:b0:390:f55b:ba91 with SMTP id ffacd0b85a97d-39132d4e369mr2759140f8f.14.1741364638354;
        Fri, 07 Mar 2025 08:23:58 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c103035sm5731100f8f.88.2025.03.07.08.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:23:57 -0800 (PST)
Date: Fri, 7 Mar 2025 17:23:55 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
	David Gow <davidgow@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 3/3] printf: implicate test line in failure messages
Message-ID: <Z8sdm7Nhk4h3hoUq@pathway.suse.cz>
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-3-5db840301730@gmail.com>
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
In-Reply-To: <20250221-printf-kunit-convert-v5-3-5db840301730@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri 2025-02-21 15:34:32, Tamir Duberstein wrote:
> This improves the failure output by pointing to the failing line at the
> top level of the test, e.g.:
>       # test_number: EXPECTATION FAILED at lib/printf_kunit.c:103
>   lib/printf_kunit.c:167: vsnprintf(buf, 256, "%#-12x", ...) wrote '0x1234abcd  ', expected '0x1234abce  '
>       # test_number: EXPECTATION FAILED at lib/printf_kunit.c:142
>   lib/printf_kunit.c:167: kvasprintf(..., "%#-12x", ...) returned '0x1234abcd  ', expected '0x1234abce  '
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Just for record. I like this improvement. But  I am going to wait for the
next version of the patchset which is going to add back the trailing '\n'.

Best Regards,
Petr

