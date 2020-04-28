Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF6C1BB34A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 03:16:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B3cb2yk7zDqgl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 11:15:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B3Yl2Z5hzDqfd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 11:13:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vB6BBBag; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49B3Yk3rgHz8tD2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 11:13:30 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49B3Yk220Vz9sSy; Tue, 28 Apr 2020 11:13:30 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vB6BBBag; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49B3Yk0S7Pz9sSv
 for <linuxppc-dev@ozlabs.org>; Tue, 28 Apr 2020 11:13:28 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id p8so9508833pgi.5
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Apr 2020 18:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Y3GGZmbxLoB4/ky/zvuMJizsm3y5Ahq0Z93yi1/mNik=;
 b=vB6BBBagJDNdjOQ1Uf4d1ItZKf/yfYwHY/Lx4bBn5067k07IaWYcjHV2b/uF0pmXv7
 oV6/eTOs1N6BYi+vy36uPtzNUOYAIsVpvjBX5lfLogz6JAzOwld2SA7HRWLoIJQCXRfL
 M2l11WtPwurHVLAY4oqywzmCJT1J4QaTfvxkdcLOQyz15hSid6YKP4TySrKfNf0gLM50
 blcQZ6QdcdSQzaKD4M/5tUqELAcaDSlv9hG3ah24B2+36Lv92gBNIX5UiDapmcJkWMsT
 naqt0aA/gek21E+dEEs7O5xEsCDGHxyXb8vgk07kBSJzBXSUqMPEisZfVZsiS+wjnx4t
 d10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Y3GGZmbxLoB4/ky/zvuMJizsm3y5Ahq0Z93yi1/mNik=;
 b=O/YWEs030tICTXTmshOFHKIgaCdaXy8XTvnUqQV53jsAxU9e5sMqLb06LUdSL8C0Jp
 I4FeLav7sk/S/fbQxqahnYgT/obd4liu5Yhn/srUhx/vRUCzCTTwu3UnXYkqADC9E3HS
 0M0EpXO1qXCa8AcdPPiGsfrSXlzwc7OG26WPPWOYAq1JNdeiovhL/lPR7CjLso9f+Gyn
 9qkB4apBRqekdG9Rl5MPZrhtgxgd+XmbSKY6FjE1aA4117nleutArBDCZTdpuWHC+eQb
 dOvbpL3qXDnmOx0T2OirvMPwvAOcGKJC7DARYlGEVqVv9D6QkglbLhg3fj/Uio9u48tC
 drhg==
X-Gm-Message-State: AGi0PubL10yTA7KYGhyrLWg9/eCiqBJiwgvDjWSRdREpuDgYVgrAw5U4
 Gfx7HOyTtM1sn5kcD3IsYJA=
X-Google-Smtp-Source: APiQypJKpTSK6oyBac2PxQyt9jZI95zOC2NCXv9W9sAxO7BuYSp54SwYztJQt2SAqQcjCBedqNTXIg==
X-Received: by 2002:a63:d601:: with SMTP id q1mr2176948pgg.452.1588036405434; 
 Mon, 27 Apr 2020 18:13:25 -0700 (PDT)
Received: from localhost ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id q201sm13892911pfq.40.2020.04.27.18.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 18:13:24 -0700 (PDT)
Date: Tue, 28 Apr 2020 11:08:54 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC 1/3] powernv/cpuidle : Support for pre-entry and post exit
 of stop state in firmware
To: Abhishek Goel <huntbag@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, 
 linuxppc-dev@ozlabs.org
References: <20200427021027.114582-1-huntbag@linux.vnet.ibm.com>
In-Reply-To: <20200427021027.114582-1-huntbag@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1588035100.usm3gb816q.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, psampat@linux.ibm.com,
 oohall@gmail.com, skiboot@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for picking this up and pushing it along. I do plan to come back=20
and take another look at it all, but what we do need to do first is get=20
a coherent approach to this proposed new calling convention and OS ops.

It's fine to work on this in the meantime, but to start merging things
my idea is:

- OPAL must leave r13-r15 untouched for the OS.
- OS ops are made available only for a "v4" OS that uses the new
  calling convention, including kernel stack.
- OS ops baseline (all OSes must provide) will be console / printk=20
  facility, trap handling and crash/symbol decoding on behalf of OPAL,
  and runtime virtual memory.

Other OS ops features can be added in the versioned structure, including=20
this.

I'm trying to get back to cleaning these things up and start getting=20
them merged now. Any comments or review on those would be helpful.

Thanks,
Nick

