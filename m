Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A1B1C2595
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 15:13:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DqLx0ZTCzDqnZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 23:13:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49DnJN4Nz1zDqcF
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:41:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cb8o8JMo; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49DnJM2gWrz9CJK
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:41:23 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49DnJL6w23z9sSs; Sat,  2 May 2020 21:41:22 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cb8o8JMo; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49DnJL2CKHz9sSr
 for <linuxppc-dev@ozlabs.org>; Sat,  2 May 2020 21:41:22 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id 145so2884038pfw.13
 for <linuxppc-dev@ozlabs.org>; Sat, 02 May 2020 04:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=5AT7+IpSsbXSBIYQELAFYrNbOFWME1dAXDAJ7qmsqGs=;
 b=cb8o8JMo4SX8ac6F0+/HNxULbKc4UQsIuHnCuRiHEZkq3Nusku4/tvSi6oCem2uqqN
 pVyLF5WBGjJRY7aqU0qeQeKQPLddzlpheoVyiY6NRTWr3wWBFLOw7PUYFuSx5o/pASJo
 LTiSNJNtjwVjFnJRRG0PaASJ7a2hLycUVE8PcIQ//VihgYAqtM2BA/sJfWwJ99IbLpQo
 zcyGQhJlPW7nL8kO5WtOyfY4Y6ciN/u7iJYUXnlE6gR6g53ebq+70It/F3s9WoumDGI6
 6Dv+oXeHaWIjqJ0AxXxRLXba6szJwk2TeTtQQnVTwCkFjC+f8Xgfo14FxDK0snBq3h4T
 UHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=5AT7+IpSsbXSBIYQELAFYrNbOFWME1dAXDAJ7qmsqGs=;
 b=ng76mq0+ATCIamUeDexY9y8FG+nysdw/gnyJ6pjQVS3Gl2NkNbUAnUyTe3BuojnBKQ
 ccZ75qAtGIbHRyG39avXwYaXXmjAXB1b1QQkswnYGfzLhBjM3sDCpTg7oIf0QA3zIwuy
 HmDfIYO7+FP0hQzhcMwjAE8v05A46rg5rWmTtkxEGUiWu1cfw6hxjuP8lu9oQOkagwcL
 x+ZqL45o+d8f9I9WXKQ3z+WpjMPd03yFG24gkHj2g+9eSn/fQ9LbeQkEpO1AwWAblvEc
 Ce4PLKbUPYUo1BW31Dg7Tic6QgEsPUjJLXxKXOxL2vv3fRdeDUfdJ+DgHAwixTgT85X7
 4cZg==
X-Gm-Message-State: AGi0PubnCwA8emJ2JO3XfurWFCzWmjGvSF6Nzd6qcKmPZYO+a2CJ3GxC
 eipdS/4eYHdhKGGl3YucXf8=
X-Google-Smtp-Source: APiQypJn8zVCOtsAbAbRZ1Z0A1hzS9ZvdUVdyPxsKbbAeoUVvPTZLYoh5nPwD3m3QAlcTvnNBYN6XA==
X-Received: by 2002:a63:1c50:: with SMTP id c16mr8272838pgm.255.1588419678667; 
 Sat, 02 May 2020 04:41:18 -0700 (PDT)
Received: from localhost ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id u5sm4002994pgi.70.2020.05.02.04.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 04:41:18 -0700 (PDT)
Date: Sat, 02 May 2020 21:40:46 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC 1/3] powernv/cpuidle : Support for pre-entry and post exit
 of stop state in firmware
To: Abhishek <huntbag@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@ozlabs.org
References: <20200427021027.114582-1-huntbag@linux.vnet.ibm.com>
 <1588035100.usm3gb816q.astroid@bobo.none>
 <66ce544a-c1bf-4e84-2a7c-7480bbc0e12c@linux.vnet.ibm.com>
In-Reply-To: <66ce544a-c1bf-4e84-2a7c-7480bbc0e12c@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1588419467.wibmtct2qc.astroid@bobo.none>
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

Excerpts from Abhishek's message of April 30, 2020 3:52 pm:
> Hi Nick,
>=20
> Have you posted out the kernel side of "opal v4" patchset?
> I could only find the opal patchset.

I just posted some new ones. I have some change sfor the cpuidle side
but I haven't really looked to see what needs reconciling with your
version, but I'll try to do that when I get time.

Thanks,
Nick
