Return-Path: <linuxppc-dev+bounces-857-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E7E967EDC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 07:37:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WxyFf67Ddz2yF7;
	Mon,  2 Sep 2024 15:37:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725255112;
	cv=none; b=YnBlIlZtmZ8ACcJGTSlL+PtsmEolYujbHbFl0yVjfdCmjt4RzWrGOtBaqpfmjlVgI+KfzA3nJlnOgL/eD5FhYonL1KWrZfadczuQTYPcJzFUup2oZHqAaw2r3jcMrcuyZ+y6fGaDyCnoB6DQtNwNiJibqPlo4f5K0PHfj4WIAfkaE342oW0cGtOFx8G1ibzReS5JWcZnSQRTOxa/GNdxgHnkzNtY6pwXKbhqA+noPyXn7aypjjRoCiYWQbWdOgfKSWsp7a7tRgoWiBMs72GMBlvkHE4G6B021Y+oeUF8eSkJBdmO7J/N2Q/ZfO8jfqfwwy5fR3FRzSQyG2+SRolaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725255112; c=relaxed/relaxed;
	bh=dcARxruAP0vzhVrIv4mZE+MUS7Q/ymIzQKM3BTvM2Fg=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding; b=P9mlbk9giKllJL9StEhkH7KbLpAaipmBrlWcSp01/7PMD8cxCPZae4NZl3KeoM1OD+5TcBramKRfMVvuRGyXj1PRCcaAg9pbY6SUHRRtHdc6737R5Gh/WQup+yK9FkVfQQQdpItIKVFf/vp62RnE2AFMzTLhQDBzFt7ox4DmyvGv0TxSTfiSur3ySIaKuJEy4+R1U/CWUXJ8+MQ4CIen2/GeP7WfgjWs73KFHjQt8PN2ubz5n1AygaBGHV3gpHAgvQZfqsKsO9wKZB/B8POjFDQVVsdP5bWfRppUJX5vXIkZUWn24YMXKgvybsDlolrYzsS9sFtlvk4H3x/+EHmhAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=osandov.com; dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1lsdE40Q; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com; envelope-from=osandov@osandov.com; receiver=lists.ozlabs.org) smtp.mailfrom=osandov.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1lsdE40Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=osandov.com (client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com; envelope-from=osandov@osandov.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wxy6v41tvz2xSM
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 15:31:50 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-70f6e68a1c1so92763a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Sep 2024 22:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1725255107; x=1725859907; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dcARxruAP0vzhVrIv4mZE+MUS7Q/ymIzQKM3BTvM2Fg=;
        b=1lsdE40Qf0wg6x3GoS4z6YCwrftBt6/oZ88839YjXr9IJmOnl/Mo91ib3q6p09SEHS
         hmIPoKRVfxIT04ThifGoKa7r/yIMcdzklzzHB5QslDX5jt2o2jf6fJYvwWWdQCFMzh/M
         6zU/pbZPplIdZwXVKi6a1/UwErjUccrQOaytWM8yUv1LqAAWXYHufagd+lMoZmxBw66A
         DvtUFcHsYcmOEXuIEOcUyT+275zE8A1LyVK82hY0movY55NRt7eu6N/XcpL7TQTpsSAw
         DoCT/v/He+xr1ih2GEcxSRPQjUJvwgluxTE28zsWrV615ysPYulbRUTecNht98P9hWEj
         H6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725255107; x=1725859907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcARxruAP0vzhVrIv4mZE+MUS7Q/ymIzQKM3BTvM2Fg=;
        b=H0NbZ66bZ/w24/ZNj7Msa70SsW1Tz2NNtBoUelIBtd47cR+fuwW3LYKyMrn5C0+kE9
         Qb16DRsp1RRmeNDD1OmaHwodywGXnUhM9C0G5VbHrVKlr4qCUKzCtFWrpMwVBTY5sjRl
         pCjBjI0OCCGoxeDymwepDSBRaBbISXvCzevH7Om4YjL7rlvINcbtA6tvunJ86n5O1Pa0
         iXuvgdqjCdKhGz7rzAmXWt7orHfngEu8PYNv6G/H5ZHEqzbF2JXclP9aiaM2hsKAsOay
         RaIfSjp6Qtu5tqQAL8GhOwBibJXVaRYkDvUXSLflX2UvZzQ0LFwGQQFJH8k3E1u7V/PP
         Y/yw==
X-Forwarded-Encrypted: i=1; AJvYcCWLE015eLjENWiGGbhbohPjSMZLZn7cakZKpOKRIAvkSJpmMZmqXJvhX6dq+dlyaPDdisFNMe1hSdj0Dug=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz3zsA/BPBZc4NyrSFRDSDcXj/XUFfQ3EMHLc7ZpCkieISsVzAo
	14OayOs9SQn728CLC2iT4IxyEeeCFFAayaoOqVRmuXIaQWQ6sW5R76kjnDeM3Ls=
X-Google-Smtp-Source: AGHT+IG4O9VSEnbCHyMlef62PC66eJmk+Wcfg7k+VoUwjggysZcp2Zp81AWYRWJzYn+qz65dfh/WPA==
X-Received: by 2002:a05:6871:b09:b0:26c:78ce:b0cc with SMTP id 586e51a60fabf-277b0dd215bmr5158894fac.8.1725255107434;
        Sun, 01 Sep 2024 22:31:47 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::901f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a692fsm6076279b3a.60.2024.09.01.22.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 22:31:46 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-um@lists.infradead.org,
	kernel-team@fb.com
Subject: [PATCH 0/2] mm: make copy_to_kernel_nofault() not fault on user addresses
Date: Sun,  1 Sep 2024 22:31:27 -0700
Message-ID: <cover.1725223574.git.osandov@fb.com>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Omar Sandoval <osandov@fb.com>

Hi,

I hit a case where copy_to_kernel_nofault() will fault (lol): if the
destination address is in userspace and x86 Supervisor Mode Access
Prevention is enabled. Patch 2 has the details and the fix. Patch 1
renames a helper function so that its use in patch 2 makes more sense.
If the rename is too intrusive, I can drop it.

Thanks,
Omar

Omar Sandoval (2):
  mm: rename copy_from_kernel_nofault_allowed() to
    copy_kernel_nofault_allowed()
  mm: make copy_to_kernel_nofault() not fault on user addresses

 arch/arm/mm/fault.c         |  2 +-
 arch/loongarch/mm/maccess.c |  2 +-
 arch/mips/mm/maccess.c      |  2 +-
 arch/parisc/lib/memcpy.c    |  2 +-
 arch/powerpc/mm/maccess.c   |  2 +-
 arch/um/kernel/maccess.c    |  2 +-
 arch/x86/mm/maccess.c       |  4 ++--
 include/linux/uaccess.h     |  2 +-
 mm/maccess.c                | 10 ++++++----
 9 files changed, 15 insertions(+), 13 deletions(-)

-- 
2.46.0


