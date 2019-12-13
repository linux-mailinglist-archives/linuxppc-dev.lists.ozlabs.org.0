Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED18211DBFD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 03:09:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YvHG2LdjzDqg4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 13:09:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=itaru.kitayama@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nZ+MKqzq"; 
 dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YtZ272BtzDr7G
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 12:36:58 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id l4so474919pjt.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 17:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=hHaUgqgtybtvOjMDrlajJocitnGvmoGzX+mp68oSCDw=;
 b=nZ+MKqzqbkfQaF4ZvNuUImTvVEHiuFUE4ISXoaQD4oFCu5qyk6UK8YJthCUCkprOzM
 LWbE13xizoblSj27bs8OvgNeqPDaaoXB8f1hgHZWRbu4gKkduexb4fx3LhTKsKB1C9qQ
 ZXStX6YmjbhVbThSYaDw/iBXfHw/8O0C0HwXDCr7Bg7FIwKyNHUgJ3VN2vcXp3xa2UDz
 RYQrS8XMN5a+V85pAUZDKVz9shNqXUlcv2RujyuktxMJ1XGedUSsT9OYP8TcHT/k/k6C
 baLXCI33AHMOJsitJCzf0QBReI9VMlTf2h1Ti25kTh4wVOqvQ8JR/FKH0uGkyvbadNHs
 L3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hHaUgqgtybtvOjMDrlajJocitnGvmoGzX+mp68oSCDw=;
 b=gLWhPrrh/325Dh/h74KnATam2vycJAD+eZ+Vc/yFLnVLECGnc8y6S1ky5FMHcM1teK
 +8YdiBUvkdKBvN1ebt5THcgSfLVUwQQ6E45yMFqSWirg0IiaoAD5lE/UYsdZQNs/02mL
 dJfjKVJE61bxttKAZKkc22z1e0u6J0nrkLo2qIB2sZQyPfgwISkKq6lArkmImZVT+okA
 0qbc2o/sRLjHC8p+wouEZQtUdxwkWYCnxtiqdkxT4i3k52agDgf5SFOFkcwOY+Qe6ZX/
 84tqjfcWeOIYvA8TJotuRbYTASyslWIqb8Or11ITrVTy322VKPY2TauF8lmqH8+NdcBu
 RTtw==
X-Gm-Message-State: APjAAAUmJoP6fAo0oOChlxmzUxMrUlZs546kqGOQmP7/RZkvZfo8n2aN
 mo4Mp3V3E4lWht3EwqjMlux8xt+k6fhE6iaa1N8KzA==
X-Google-Smtp-Source: APXvYqx+hlsQMIWXhuRLKsKO/MQguDvdspE6W+gDqIUvkV0y9gbbY/BjS4o6pzS0bpQQDDVpBNJm9AccNY+6S8bGv4k=
X-Received: by 2002:a17:90a:9dc3:: with SMTP id
 x3mr13469781pjv.45.1576200567594; 
 Thu, 12 Dec 2019 17:29:27 -0800 (PST)
MIME-Version: 1.0
From: Itaru Kitayama <itaru.kitayama@gmail.com>
Date: Fri, 13 Dec 2019 10:29:16 +0900
Message-ID: <CANW9uyvtfFyZFxeeVEUGqW8u9zSW17DYTbhedaDsOwg8tANb9w@mail.gmail.com>
Subject: Isn't LD=ld.lld enough to get a kernel build started?
To: linuxppc-dev@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000ed23f205998bcaf0"
X-Mailman-Approved-At: Fri, 13 Dec 2019 13:07:40 +1100
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

--000000000000ed23f205998bcaf0
Content-Type: text/plain; charset="UTF-8"

Hi,
Or should I set the LD with the full path to the LLD linker?

--000000000000ed23f205998bcaf0
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Hi,<div>Or should I set the LD with the full path to the LLD linker?</div></div>

--000000000000ed23f205998bcaf0--
