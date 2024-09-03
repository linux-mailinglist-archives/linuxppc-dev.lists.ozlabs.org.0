Return-Path: <linuxppc-dev+bounces-936-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB31A96AA0E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 23:27:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyzGp5fgSz2yMD;
	Wed,  4 Sep 2024 07:27:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.178
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725381081;
	cv=none; b=XWu96PO2yabsoGQDtdyyieasWFNPyJXIdY2AJM1y1suT0bMHNMZrocpfB+VY1fYYMHyZycLyrrQ/OKLGcCl7a7s7e0hEn1LxewRVle3jNg0POk14L1OFEbLpAO25+5tpJReyN6qJbpx4rJOAWwDb8ZQA1m7a1syGAf046Mt3rFU2jNNTOoEG9OJP0+O9YhGOCYz/LSM5Ww+sMos4nX7wN4zdv+5n2NH1bHgvZfLezJfWsgIENvguQikvNIzMEOgtL+4Fa5IGI6zI7MLI9gA5209wcL0HkTNKWjNpuOzak0yxqOklnnuhB4y3vvNpz90Wv3LoHc9tLFH8hwAten6xvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725381081; c=relaxed/relaxed;
	bh=ItTT1ofl67Qx6qoM/paB6gC9h88l9uMn+lTF4xll28I=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=USQYOxGwj+iom10Fky90v+Y/Ynh5l1iYlWXXqtHWHOJ7Qy3lMzVOTu75XXVcGjaeKbbueYDez/ZKBhYBvrAEDwy6zmvanB/e89XdVsIOA6W3hJHb7mk85/vYW0BvhOIR0NNybtqNpxYsJbYJk7fkPXJXzRuxhLEqwka2TUtZZLzaMXGbq7Nt65MnjIpbW6OPy3cMZoKxRJY4BdM9yyVX36AATbfdqz5NIb8UJJWkgfa+OYSMEu5W6KCNvnutRfm8+6z07qjDUxngF6kpx5gEW3tEXMpG0FnE5hejlsP3TJXDeO7OFL2eUfu0JTK6jekh8VrbCgPFM41xlU15MNFSZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=91.218.175.178; helo=out-178.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.178; helo=out-178.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyrjH5b1Rz2y8V
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 02:31:13 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725381053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ItTT1ofl67Qx6qoM/paB6gC9h88l9uMn+lTF4xll28I=;
	b=wCxhUgXywgh+iCSp5MYg6y1jvSHm2x6diiCwreF2/QMspOI24IUZvviIXnFNZ11wawMDci
	3Nz4MnXUCSaklvWm8V8TqnIff8oAwwCmd2J9Q1zJGal5hQB0Dr6SHRgUOONajgn4bpxXSB
	+z8T3JToDc0X+uzmbf5/QTNUkjfaPYU=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com,
	thuth@redhat.com,
	lvivier@redhat.com,
	frankja@linux.ibm.com,
	imbrenda@linux.ibm.com,
	nrb@linux.ibm.com,
	atishp@rivosinc.com,
	cade.richard@berkeley.edu,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH 0/3] Support cross compiling with clang
Date: Tue,  3 Sep 2024 18:30:47 +0200
Message-ID: <20240903163046.869262-5-andrew.jones@linux.dev>
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
X-Migadu-Flow: FLOW_OUT

Modify configure to allow --cc=clang and a cross-prefix to be specified
together (as well as --cflags). This allows compiling with clang, but
using cross binutils for everything else, including the linker. So far
tested on riscv 32- and 64-bit and aarch64 (with some hacks to the code
to get it to compile - which is why there's no gitlab-ci patch for aarch64
in this series). I suspect it should work for other architectures too.

Andrew Jones (3):
  riscv: Drop mstrict-align
  configure: Support cross compiling with clang
  riscv: gitlab-ci: Add clang build tests

 .gitlab-ci.yml | 28 ++++++++++++++++++++++++++++
 configure      | 11 ++++++++---
 riscv/Makefile |  2 +-
 3 files changed, 37 insertions(+), 4 deletions(-)

-- 
2.46.0


