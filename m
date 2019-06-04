Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8DF350A0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 22:07:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JNHw5WxGzDqQd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 06:07:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::141; helo=mail-it1-x141.google.com;
 envelope-from=matthewgarrett@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="pv/6OPT1"; 
 dkim-atps=neutral
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JNGQ46XSzDq5t
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 06:06:00 +1000 (AEST)
Received: by mail-it1-x141.google.com with SMTP id n189so59985itd.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2019 13:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZREhuJlsDtH89ZVDYphzf41RLCVZZkM936cBZurEuKE=;
 b=pv/6OPT1BwcW5kLEBR+t89bzJ6UremuUyrRRzifMONzXagldwUIj4ryQti4Jce45X3
 YEqlt80vgw/1s9GumZrTUbCOUG1NmsmW6pUOoHe9r1iHLbpAPBsMiCQti4XuzcoymGTf
 yRK4Yp32kJT1dNc4oAtYkpiMcmE6Y3X7yQXCgUTLsgrsSA7TI8MEz14fbjA3EbNcjAlY
 2idbOTzsQd664g8fX2JJ8XhDoeqMwDy4YUdEwBa5PaQXDZn8oJjRkRjkseIlZr4mFJto
 QT6ZqnKS7YsQaium2oEVGTjkIDxej2XHbJmZ/VKarQFFIw/oW3HevHdtuWUbxY+c7WM1
 NCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZREhuJlsDtH89ZVDYphzf41RLCVZZkM936cBZurEuKE=;
 b=nQruzOl0HhARh+WIHy4YOvEfAFmqL16vbKC4eTELeuGB22eDMT+LikbX6YJPqCaKV6
 rvVqQ9kk418jReZKCn4lxztE61LIoseyi44LfrYpZYWUpBEJIQbwkXul03fizZ7x8pj6
 NQhFUzMVHpS9SvinU+XoNU4YJlC0T6fIZ9zKVe1eTy1zXGfU8FQ1PeFrIho1bvo/RqST
 5OR67WNt5FxyGMJe0LPP4wbQ1B9i2S2e4yDOJP//ZHtXzKqJnEv+ysKN5Bt5hgYEFatC
 OhaFpz5xBHPt4iOCt/7oeBYKQx1eVluCiKTo5xOXsNeli91mhnYpKocbWb//8hmIx9iQ
 AOVQ==
X-Gm-Message-State: APjAAAUMiiDUOu+ljakf+gG6wfiW1sTHUvHlmYEJhpLiLB/TJr3MmKZu
 OExgOJ2mt87iFJcj49FYrMcQxBK6Y64WowlboY5iMQ==
X-Google-Smtp-Source: APXvYqwsa9hUdLg9OFkrqEiChjF1ClMm07RxLnCex43+ESQGujO4p+QXESe0Hiljy+pNbzZoo6W0gnVr8MJ1YwSahpo=
X-Received: by 2002:a24:bd4:: with SMTP id 203mr22280225itd.119.1559678756641; 
 Tue, 04 Jun 2019 13:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190520062553.14947-1-dja@axtens.net>
 <316a0865-7e14-b36a-7e49-5113f3dfc35f@linux.vnet.ibm.com>
 <87zhmzxkzz.fsf@dja-thinkpad.axtens.net> <20190603072916.GA7545@kroah.com>
 <87tvd6xlx9.fsf@dja-thinkpad.axtens.net>
 <b2312934-42a6-f2e7-61d2-3d95222a1699@linux.vnet.ibm.com>
In-Reply-To: <b2312934-42a6-f2e7-61d2-3d95222a1699@linux.vnet.ibm.com>
From: Matthew Garrett <mjg59@google.com>
Date: Tue, 4 Jun 2019 13:05:45 -0700
Message-ID: <CACdnJutpgxd0Se-UDR4Gw3s+KfTuHprUTqFqxq+qu17vd4xr7Q@mail.gmail.com>
Subject: Re: [WIP RFC PATCH 0/6] Generic Firmware Variable Filesystem
To: Nayna <nayna@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Greg KH <gregkh@linuxfoundation.org>, Nayna Jain <nayna@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 George Wilson <gcwilson@us.ibm.com>, Elaine Palmer <erpalmer@us.ibm.com>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 4, 2019 at 1:01 PM Nayna <nayna@linux.vnet.ibm.com> wrote:
> It seems efivars were first implemented in sysfs and then later
> separated out as efivarfs.
> Refer - Documentation/filesystems/efivarfs.txt.
>
> So, the reason wasn't that sysfs should not be used for exposing
> firmware variables,
> but for the size limitations which seems to come from UEFI Specification.
>
> Is this limitation valid for the new requirement of secure variables ?

I don't think the size restriction is an issue now, but there's a lot
of complex semantics around variable deletion and immutability that
need to be represented somehow.
