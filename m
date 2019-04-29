Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A512DB5A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 06:56:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44ssmz0zCnzDqNJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 14:56:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="MT3mzMT7"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ssks4KYgzDqNB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 14:54:12 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id 188so4697107pfd.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 21:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=CXY8NMI+MMoFwyd5a0U3G9swoqWap2mhzcLLts/Z+iE=;
 b=MT3mzMT76800YDXvDZ5HeHvywukXbF/p5hE0jBqJpGYZZg1bhMX2UHmZ1HU1dvIheR
 9V3fe+IwApl8EGbBqr2IZkMENTIoZrC2hLsTBul7PX4wqT1iG/MuEFlYgfUtMUoSToFc
 7CbzrSVAtGB1V9nsEgm59WhrmtIFGM7bhpw1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=CXY8NMI+MMoFwyd5a0U3G9swoqWap2mhzcLLts/Z+iE=;
 b=qQ7VZqQOU0FUJiimI3ETlc2UYQeoQJrxnItA++f7Ps3dU5dJApfIqp224WslUo6e42
 vzC6tCxn6skC14Sn5AzSpL90JPmbacHBkWr0PKg1gcVpnAKO+QS0JDk5f/eZSnR3v7Z2
 YH+bmDQlgPDbZMhrtITh19PG66svmCPeBrVdANfiIeaYT/8Z4kx9OiB76Cv1ag7TrZbd
 H8xpEBo1dR6erCPyK73e42WmhSH5mj8R8YNbQ+VVxxNVOcA8dPrFBPkU3HyjMzqFAQBT
 80nlZrNiUUdTj8gQbQmuLJYc3ERbHf6b7A31ATIN8AWR0u3PNTYwkJqp/ZKmc3QyfwiU
 ZR+A==
X-Gm-Message-State: APjAAAUqZS0KzCgv8F/oGfNJ6GD/wr8RbrCsMufdaJOqjrwZxESrmEC3
 A3J+g89JGpR3KF8E07u0I+nXLw==
X-Google-Smtp-Source: APXvYqxOmKGuDu957cqrxEQ+1VImzuI7N1RjWAr+p16Qnie6ZNUhOIBHM3h6IhCgt1zC9o45e1De9A==
X-Received: by 2002:a63:7d03:: with SMTP id y3mr55014550pgc.8.1556513648514;
 Sun, 28 Apr 2019 21:54:08 -0700 (PDT)
Received: from localhost (ppp121-45-207-92.bras1.cbr1.internode.on.net.
 [121.45.207.92])
 by smtp.gmail.com with ESMTPSA id j67sm74431179pfc.72.2019.04.28.21.54.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 28 Apr 2019 21:54:07 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Matthew Garrett <mjg59@google.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Subject: Re: [PATCH V32 01/27] Add the ability to lock down access to the
 running kernel image
In-Reply-To: <87wojdy8ro.fsf@dja-thinkpad.axtens.net>
References: <20190404003249.14356-1-matthewgarrett@google.com>
 <20190404003249.14356-2-matthewgarrett@google.com>
 <059c523e-926c-24ee-0935-198031712145@au1.ibm.com>
 <CACdnJus9AhAAYs-R94BH7HDuuQfXjgdhdqUR6Pvk9mxbuPx1=Q@mail.gmail.com>
 <87wojdy8ro.fsf@dja-thinkpad.axtens.net>
Date: Mon, 29 Apr 2019 14:54:03 +1000
Message-ID: <87tvehxvh0.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Linux API <linux-api@vger.kernel.org>, cmr <cmr@informatik.wtf>,
 James Morris <jmorris@namei.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 LSM List <linux-security-module@vger.kernel.org>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, 

>>> I'm thinking about whether we should lock down the powerpc xmon debug
>>> monitor - intuitively, I think the answer is yes if for no other reason
>>> than Least Astonishment, when lockdown is enabled you probably don't
>>> expect xmon to keep letting you access kernel memory.
>>
>> The original patchset contained a sysrq hotkey to allow physically
>> present users to disable lockdown, so I'm not super concerned about
>> this case - I could definitely be convinced otherwise, though.

So Mimi contacted me offlist and very helpfully provided me with a much
better and less confused justification for disabling xmon in lockdown:

On x86, physical presence (== console access) is a trigger to
disable/enable lockdown mode.

In lockdown mode, you're not supposed to be able to modify memory. xmon
allows you to modify memory, and therefore shouldn't be allowed in
lockdown.

So, if you can disable lockdown on the console that's probably OK, but
it should be specifically disabling lockdown, not randomly editing
memory with xmon.

Regards,
Daniel
