Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC1430DBC7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 14:51:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW34D2Sc8zF3Dr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 00:51:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=d2+USt6G; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW0c123MWzF02d
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:59:59 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id r38so17191392pgk.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Feb 2021 03:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4uA7JS93JPw+++xZutM775VMPEwshLnvxHWwIlWPugU=;
 b=d2+USt6GcAhvlOc8tGw3hsChBNWfxsSnLznhf7fC6VHAyqS/x37U9wf21RzuKaqpEc
 Gu0rihcnDrxrnxt7uXUJl7jBPFQtpBns9Hw96l3h5hWQzQWSyLODxP1tOdU1uv+uslnQ
 P5cHSHV0uzntCFocPks3q0MkcoC4SwzEGPyBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4uA7JS93JPw+++xZutM775VMPEwshLnvxHWwIlWPugU=;
 b=aUWlEgni+KTNq3BW299HbUOY7BrAWKhiKE1Dmfa5zUgDZxVwkml6m0wv4VNbYJH3NY
 04UnNMdya5AdDbJUCwlp+50IwQmT3Cgy/4MyhlcjQNbRYPqTrA33i+MghHi5v+lzwMPm
 LQuJQk6nzcC+1/gKbn3BQDfcUqSn0ulNkTToR2e3c+JgPP6SOVmSHtuMzwR6m7mFdbmF
 QVrMrhaeiA83Rmkiu0HZUbjAi0yHd4gmYRZ/sqd7d/PRfQlOEziYD1snjZ1QkgkJZBBJ
 gd9X5S3l5h6X4Sc2k0q/ab+bVGkm2ZlDUVVoin82YIgCXGKgxrrf3DRc7S10789xeSCH
 fyvA==
X-Gm-Message-State: AOAM531gqj9oOImET/oUITzlPk90XuwY+yz7er76PLdv72ZQbL1T3Ea1
 8aQh3FhaUF0t5yiBWSSXnK/njw==
X-Google-Smtp-Source: ABdhPJytDZ4HM1r1NSCsMK44ojj+trhGOJ6I1kDuMv1LN3tUVACngwIVni/g2RNcS/9H77+1iU6anA==
X-Received: by 2002:a63:ca51:: with SMTP id o17mr3244885pgi.314.1612353594659; 
 Wed, 03 Feb 2021 03:59:54 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-1c59-4eca-f876-fd51.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:1c59:4eca:f876:fd51])
 by smtp.gmail.com with ESMTPSA id h190sm2196512pfe.158.2021.02.03.03.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 03:59:54 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
Subject: [PATCH v10 0/6] KASAN for powerpc64 radix
Date: Wed,  3 Feb 2021 22:59:40 +1100
Message-Id: <20210203115946.663273-1-dja@axtens.net>
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

v10 rebases on top of next-20210125, fixing things up to work on top
of the latest changes, and fixing some review comments from
Christophe. I have tested host and guest with 64k pages for this spin.

It does not apply to powerpc/next, sorry: there are conflicting kasan
changes staged in next.

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
