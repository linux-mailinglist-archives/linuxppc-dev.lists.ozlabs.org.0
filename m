Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8AF341FCF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 15:41:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F26621cFZz3bsc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 01:41:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=GYlAFBv2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=GYlAFBv2; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F265c13DYz3bcq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 01:41:07 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id bt4so4753737pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 07:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JMTZPdTE/aMUDIoULLEYEVVyeOj9JMcW8Ag8gkApcG8=;
 b=GYlAFBv2hVH9zVW7eDuOt74/YKU618uB0XcxKKzYydhK/xHH6uRUbGe/+odzkPTFKW
 hEszJNjv6g5hyao1Oqax0qywro1jPO+BgzYqshqU6Bem1v5HUynvd0jTgbEgvgUBrI1S
 5BG6Uwvk0JFWd8hod3flUFu8OHPeXrqrC9pew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JMTZPdTE/aMUDIoULLEYEVVyeOj9JMcW8Ag8gkApcG8=;
 b=e88y5loLGruXiNFk00P9lAYVOiqjCvh5w34TYPyhkGlcFjy79KhKEW0Z8y8sXXyvQ6
 NCWGhqyBUMN8UrpBPD5g7ysuqhzHDWEZf83Zw/8teupgFIFSZk6Cz5x1JeA86MFl27eb
 1QuQTYy9rtlMjAiu8Ch2sWIpvEhSrb9ZRzcsfQUSgyWLFFOvVAp0N6qqHnKakgDg/mS0
 zA7wU9iFgopy4fST0ZcFdCX+DygIf6SxU7pTDHcaBu4OWbefa7XmDiyEK1aBn1wpraBP
 c0hsYs02XiSREuIgAgtZFk0HcwBiLcmlKSXV3lQxs6D51trhUSXxYS66L4JPmfYdbBrk
 Mkng==
X-Gm-Message-State: AOAM532MOAQtYLvj83ha9dN0sfNZRQLegtCEb8vqtRRUGOKHDlZ42ruv
 BtSnpoVIiojMkWJCI9auUZYzOQ==
X-Google-Smtp-Source: ABdhPJxlMSF9N8TsI+7JmybLd20c1cK01aJvUVhZRerB4UyQEjpJ8VtHIcBPF1ZR8qLARnh3lMogvw==
X-Received: by 2002:a17:90a:516:: with SMTP id
 h22mr9634409pjh.222.1616164864070; 
 Fri, 19 Mar 2021 07:41:04 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-674e-5c6f-efc9-136d.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:674e:5c6f:efc9:136d])
 by smtp.gmail.com with ESMTPSA id l4sm5692224pgn.77.2021.03.19.07.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 07:41:03 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
Subject: [PATCH v11 0/6] KASAN for powerpc64 radix
Date: Sat, 20 Mar 2021 01:40:52 +1100
Message-Id: <20210319144058.772525-1-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building on the work of Christophe, Aneesh and Balbir, I've ported
KASAN to 64-bit Book3S kernels running on the Radix MMU.

v11 applies to next-20210317. I had hoped to have it apply to
powerpc/next but once again there are changes in the kasan core that
clash. Also, thanks to mpe for fixing a build break with KASAN off.

I'm not sure how best to progress this towards actually being merged
when it has impacts across subsystems. I'd appreciate any input. Maybe
the first four patches could go in via the kasan tree, that should
make things easier for powerpc in a future cycle?

v10 rebases on top of next-20210125, fixing things up to work on top
of the latest changes, and fixing some review comments from
Christophe. I have tested host and guest with 64k pages for this spin.

There is now only 1 failing KUnit test: kasan_global_oob - gcc puts
the ASAN init code in a section called '.init_array'. Powerpc64 module
loading code goes through and _renames_ any section beginning with
'.init' to begin with '_init' in order to avoid some complexities
around our 24-bit indirect jumps. This means it renames '.init_array'
to '_init_array', and the generic module loading code then fails to
recognise the section as a constructor and thus doesn't run it. This
hack dates back to 2003 and so I'm not going to try to unpick it in
this series. (I suspect this may have previously worked if the code
ended up in .ctors rather than .init_array but I don't keep my old
binaries around so I have no real way of checking.)

(The previously failing stack tests are now skipped due to more
accurate configuration settings.)

Details from v9: This is a significant reworking of the previous
versions. Instead of the previous approach which supported inline
instrumentation, this series provides only outline instrumentation.

To get around the problem of accessing the shadow region inside code we run
with translations off (in 'real mode'), we we restrict checking to when
translations are enabled. This is done via a new hook in the kasan core and
by excluding larger quantites of arch code from instrumentation. The upside
is that we no longer require that you be able to specify the amount of
physically contiguous memory on the system at compile time. Hopefully this
is a better trade-off. More details in patch 6.

kexec works. Both 64k and 4k pages work. Running as a KVM host works, but
nothing in arch/powerpc/kvm is instrumented. It's also potentially a bit
fragile - if any real mode code paths call out to instrumented code, things
will go boom.

Kind regards,
Daniel

Daniel Axtens (6):
  kasan: allow an architecture to disable inline instrumentation
  kasan: allow architectures to provide an outline readiness check
  kasan: define and use MAX_PTRS_PER_* for early shadow tables
  kasan: Document support on 32-bit powerpc
  powerpc/mm/kasan: rename kasan_init_32.c to init_32.c
  powerpc: Book3S 64-bit outline-only KASAN support

