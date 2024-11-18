Return-Path: <linuxppc-dev+bounces-3402-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB909D0C99
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 10:51:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsNF72BP6z2y71;
	Mon, 18 Nov 2024 20:51:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::131"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731923499;
	cv=none; b=fzFLh+zPqX2SUi1ZV3oDO9gvv3Qcb3VCzbtsOG5cgmZJ1LGAaOYOg9+VGBbvPpyu9bndei6hyjTqH7srRzXr158y6WTUOt6Kv8ZrqTW7yKMhVlALQDNGWCjJv7LS28whquwuaigedENoOLp6Q5Tm0zPjSiiRKKvpOgsWP5XcX6z75KQUgMKGJMAX4wzEgdIeDh9CqxL3WkeDeWQ+ITdTFwjotjfQ1Ilq8wz7nEH5q7hNiBuaY593Hv7cV+pI3OrlXK9GQsCLS0+1TLXngmqKAzaVIy1JrdyVokAM+irbRAy2kRe/UWtBnb7uo495QVTW3rbJiRdogeAkQWly1lGyfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731923499; c=relaxed/relaxed;
	bh=9GTB33TPyEs/YX3y0tXNN3wmTVS6LNkgjt3Ay0YqbHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BeHwcJviRozz/FGXmLxEyqfvVdFAJC/S0NVHaFw9Q+SxlI1JjYG0YoJoxUDqGSiX9G79pRULAWSWIHz+gGjPMs/VQ9r8+olxgnlUN3+LNAXSSwk31sRUU9pSB3/qxlJYHilp2EmX9fSwEFmN3kHFTW3kOIW5RD7AXcyWJEDu+UCquj+yBHt0+xIY2HQ+lmZTd3xcDIO17QZ3lsDt/YGTppLQ6bXW5TbgGLZY0BdfNyCZLvCRfHTbIZk+2KB/7CkLZ5VknVIoEvmoSlq2ezlgcK6mvwVQumGnZp5FFiXEbr7G5jhNMGFUhfeyPZXx8HFGmkQswqqPp9HRu1uQ80vOlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=T8WRPi4+; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=mhocko@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=T8WRPi4+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=mhocko@suse.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsNF21Lbqz2xy6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 20:51:32 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53da353eb2eso2248659e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 01:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731923489; x=1732528289; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9GTB33TPyEs/YX3y0tXNN3wmTVS6LNkgjt3Ay0YqbHU=;
        b=T8WRPi4+ujS4cssWOUGQWcHasHT4BFsdFz92VvzA3icULpPzH0nLBiA6cMIlnSYMOg
         vM/moz62ab+F2Ck0+TLvoaTQ0rLlhZyw2My3ql4LEslffMPKusn1qU+7oeP3zVO6ZA1n
         lm8xZ7CjKEtk1cVxX3tfnkKYsE51gxLDLYhW8z4TidrOB88q7odFoZA7bD5EbyxaawjV
         WEI1rrBR5j7Mt2dxXctcCCSQG7WagS+VdvNcQnkTZ58ppUZy33ScotHbZRPSbxcetFUD
         A6OQeEg1O1DOQUUgPKJZv+89PsXJRcmaXZDXUwQvuj/d5HVm+Dd00ji/XMFWMmUuEDpx
         9zfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731923489; x=1732528289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GTB33TPyEs/YX3y0tXNN3wmTVS6LNkgjt3Ay0YqbHU=;
        b=xDZ93SGTbIhqfnQBolu/GzVCmjYaC3hwxMoH1c8HTC7GsnfTfHu4LWE1ZEbM4B6tIO
         VYEW7SEjT5ca60NPfjkSs0LKqSQHGSnUL4xjpiJ0PJ/1ar5z0oR/f25bk15Trgzp1s1Y
         o+JFzeQPot0cJNDk9PMu/sECVYnrvumOXYrQUzWFT0JcAnra3jjDocxEFx/E82VbI+zx
         oIHZDEEgPw5bHU8A0aYNRCAZGaSQyf09SF+w8ktMojJKsF3lhwVdWvzh5zdJ7aRoUqp9
         v6JerysTZWNjDYZrtLAouLps1siIvknfHUVDmQcktCkzzalSMhB4hcuaaVlb0zhnPL1u
         t51w==
X-Forwarded-Encrypted: i=1; AJvYcCVOp2TLOVb3wwRC4HyZZbK3nOkSm9V/Gs+QPWQ3maujzzHil9gbzBehriTF4RrxEZK0pAWftBD0eyIes6M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyNpGLOJIg1j8DZ4Ptx3NFC4aa6EA69C+w44vZrIPwHC8sMHrrT
	/lbm1AlOHOX6yRWcObe8nfzrdJN4IMxNbuLnKXUZbOyduC8uuK+tHND3x0VRyfw=
X-Google-Smtp-Source: AGHT+IFAGUjndOgOu4hfcbEbyo+d40bHeTZfpu3+OXzaO4JvBg5zuhrDkKC8GbHnOfHVv82NwlCBjA==
X-Received: by 2002:a05:6512:2248:b0:530:ab68:25c5 with SMTP id 2adb3069b0e04-53dab294790mr6474092e87.2.1731923488726;
        Mon, 18 Nov 2024 01:51:28 -0800 (PST)
Received: from localhost (109-81-88-120.rct.o2.cz. [109.81.88.120])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e08af80sm520753166b.205.2024.11.18.01.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 01:51:28 -0800 (PST)
Date: Mon, 18 Nov 2024 10:51:27 +0100
From: Michal Hocko <mhocko@suse.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Nysal Jan K.A." <nysal@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Segher Boessenkool <segher@kernel.crashing.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linuxppc-dev@lists.ozlabs.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Brown <broonie@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] sched/membarrier: Fix redundant load of
 membarrier_state
Message-ID: <ZzsOH7nO7okC9f4O@tiehlicka>
References: <20241007053936.833392-1-nysal@linux.ibm.com>
 <20241029055133.121418-1-nysal@linux.ibm.com>
 <ZzsDEvJn-vauz9gE@tiehlicka>
 <20241118092517.GE39245@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20241118092517.GE39245@noisy.programming.kicks-ass.net>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon 18-11-24 10:25:17, Peter Zijlstra wrote:
> On Mon, Nov 18, 2024 at 10:04:18AM +0100, Michal Hocko wrote:
> > I do not see this patch staged in any tree (e.g. linux-next). Is this on
> > its way to be merged?
> 
> I only now found it -- it doesn't look super urgent. I'll get it into a
> git tree after -rc1.

Thanks!

-- 
Michal Hocko
SUSE Labs

