Return-Path: <linuxppc-dev+bounces-10381-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61859B0F2E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jul 2025 15:04:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnDqX3cGgz3bh0;
	Wed, 23 Jul 2025 23:04:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a02:c206:3008:6895::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753268135;
	cv=none; b=cSrye2BCOP3+3KPcM8JMuzNa9PmSL7FHKpnZAxYSrqSUMzDjdF2kn+vsiDl1nI/3RXOi4LaR+wWX9lQW5aKgesVUzNBvjO9C/iklU/YnD5HNzDXsPye1z1LXH9JkpN+nDPZTQn3iSN3fFYWlhB5mFZMjgaahtltwxLUWcCfV1FyF7QEfV2BPkrJPRGpcejkAXnM4vAxxCIMYbqiooJEpLheWvLmGiv6xTsrX18Bo/xs4xSFm2Nj+AlpN1/TZGtp2RsP7Uv/lwzpjY4xU0gxhceBqG5K5Cf+9eWjVXDlBuqN7Um3BRxSAblS1NlfDKQ1ngT6y9lj8iqxxomECtTXZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753268135; c=relaxed/relaxed;
	bh=zWgxmTRAdTuIthUI5xCWlXcfVlVji5AofN4UYNLE+10=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=dsjW+UpmR18qZg5+PmXLcOQV1dntoDIDVEtC8xU+pNGkEoOo3LKVjMcElLgFqZSvoIGxNSfz1zl7cRCgmIJ65dq4XWSpPC1efb4EWSU4D5cYCtX9JTJAjOYzoYWEG82XTZrrQqo7B4/gwR4l8ljyJX/PkroblR1PcOYjXqz28r+UFiLTcHyVusVpWgPgLxkOuGslTqHpj/wRYP6U8j6KT+8eOclb5xeU8B/guZOB22eu9YCZmGN2wJmZ6NoKjmGPTVdtVMcTRd0m9T3/r+G1bhKWYdDvgOsC6Wxtddlho3a+zU6zYlWo0srhel7PcYcWtv5hRQrrbOzW7SVpXV2EFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hogyros.de; spf=pass (client-ip=2a02:c206:3008:6895::1; helo=psionic.psi5.com; envelope-from=simon.richter@hogyros.de; receiver=lists.ozlabs.org) smtp.mailfrom=hogyros.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hogyros.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hogyros.de (client-ip=2a02:c206:3008:6895::1; helo=psionic.psi5.com; envelope-from=simon.richter@hogyros.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 391 seconds by postgrey-1.37 at boromir; Wed, 23 Jul 2025 20:55:33 AEST
Received: from psionic.psi5.com (psionic.psi5.com [IPv6:2a02:c206:3008:6895::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bn9ys5jdxz3bby
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 20:55:33 +1000 (AEST)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id 95B7D3F108;
	Wed, 23 Jul 2025 12:48:48 +0200 (CEST)
Message-ID: <c4e878ae-e97c-4826-9962-fab15d7da632@hogyros.de>
Date: Wed, 23 Jul 2025 19:48:45 +0900
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
Subject: POWER9: duplicate interrupt line in /proc/interrupts, kernel problem
 or userspace problem?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

I have two lines starting with "LOC:" in /proc/interrupts, one with a 
comment "Local timer interrupts for timer event device", the other 
"Local timer interrupts for others".

This makes collectd unhappy, because it uses the first column as a 
unique identifier.

Is this column supposed to be unique? (i.e. is this a kernel bug, or 
should collectd expect this?)

    Simon

