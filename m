Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5C21367CF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 08:04:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vDVY4fKXzDqBj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 18:04:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nfQJVT7F; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vDSd18DtzDqcD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 18:02:24 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id a6so572157pjh.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2020 23:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SHkgbVNsdo3hBPtecgNQ05n7zGNFc4kTy0jm5iRygcY=;
 b=nfQJVT7FxjOoC1Q+bqmx799KMFDid3ui3x5aEG6ROUErK8/nMeJGxlUrQa0zqLH0W2
 IVOG0XxtSiWhZFygKOqsVrdD4n0n7FHXr8TAtHAxAJj6eQnk5pbs6kQXe2SRKL+tF87G
 IQ+1lvUq6M2VwEAp2UhSaVkdp6o5tx+uWnG/0pQoN+i9y1jFOx00eKGKYbphUHczPBk2
 eDDHsjT8bTrwtIsMmnc+TFRaSetQC0VgHIwSlBtZQG0uG1Un1DrrQ87lB7ewUpApuGhv
 sIj5mXMd8PtJgpu/H4jJ/5kheLjF06ip4YLUjGdvlxLJYUTwoLKa8LAquNRVX+8C35F5
 5H3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SHkgbVNsdo3hBPtecgNQ05n7zGNFc4kTy0jm5iRygcY=;
 b=FfHsXHYFStmkbruk+Lbnr2kMChGm7ETc9yOP9tjsUVYBk+h/r/FnLdSoIhYv/MhBWj
 L+tZxpKhQkxgXXIPtffgKDg+SVG53GSetqBzk+1WFaG7/EfajUjYNjpLGeeT4kAMA8/2
 bbFOdfxqtWbJ18IJ3UhpYHbeiP7hNJXykRylGa3qgdXjcsmti6fo+OzZZOA6Gt10Iv1d
 hysNrgeX9CPxE+HC2BDC6dn4BIIJDjp5gSLOUN6K52ea1+P+ZLLPIbuk/H7UvHHGe1sk
 VowwF+uX6waVF2C4phaA4mxCC/XWE/0mhXrP1taAwUC9WziieFhYHd0T7OdqJaclGcGN
 K7/A==
X-Gm-Message-State: APjAAAXS5I2VVOSTDTT4ZGFkyLikl0dj3mde2nMwHyhuQP0TS4TOgdz+
 jRP63emiK/m+ooPpm66McPWQxXholEY=
X-Google-Smtp-Source: APXvYqxmA0tsa+SyAAgZRI5OP2UpdRalaHmPrLHsbb41moz7eITYaXs2SFrx0E9aStY+grD/pSlE6Q==
X-Received: by 2002:a17:90a:2203:: with SMTP id
 c3mr2799920pje.68.1578639741087; 
 Thu, 09 Jan 2020 23:02:21 -0800 (PST)
Received: from localhost.localdomain (ohallo2.lnk.telstra.net.
 [110.142.13.149])
 by smtp.gmail.com with ESMTPSA id n26sm1309791pgd.46.2020.01.09.23.02.19
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 23:02:20 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Minor PCI & DMA init cleanups
Date: Fri, 10 Jan 2020 18:02:02 +1100
Message-Id: <20200110070207.439-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pulled out of my big series since these are fairly standalone changes

The series folds some single-use functions together and shovels around
some code so it lives in a more sensible location. No functional
changes.



