Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 647523960FF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 May 2021 16:32:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FtySQ5D31z2yYL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 00:32:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.42; helo=mail-ej1-f42.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FtyS42dDBz2xg1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jun 2021 00:32:35 +1000 (AEST)
Received: by mail-ej1-f42.google.com with SMTP id qq22so8730721ejb.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 May 2021 07:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=coTzhk6fH6zG+AoLupwrRfb8b1cQdtJClT31zpmhiG4=;
 b=mv0rNB6VYPBz/gHd+fVPvfojFvoDzpIE6D10ww/ogzL6FsfQQUrqUdruuk7CxU/LSe
 aKsJS89rqgHSs8UjJa+Sf/edvnPU3QuRsfmG2mHPzIcvp0J3oiyZM+3N72dIS/f+obEk
 MYA+ff7mCtteYMqM1PGnODsnMyhstlerOu5iq1EZ3HTvVCQuQARZIFP5kCeDn/N0D4op
 ztzOniFA0k5+UTUSOCdsADhsN/BU4EL2KwBxqtcYQ1sKecH7J+wsgOKKwOPi+HVjj15w
 acMB7GYiQfLce4ailloGRj+U0LFt6l7wbW0P31sHc4OrX6uF9DPzQHd4/E/1oF/fZsbQ
 ezLA==
X-Gm-Message-State: AOAM530AwanuyD/azc0DgKIHTwFBY+TamF1ivkrm4eJfd3BwAJzSU8UZ
 nveiDMWpTvKxpmhi2t08+/0=
X-Google-Smtp-Source: ABdhPJwpumZCQH+aZf69Hk3S2EUGNIXepfRBGONlrmp7NxTkp0nhmjIcK3SU66wAj+ANIJtyBPC7Nw==
X-Received: by 2002:a17:906:606:: with SMTP id
 s6mr22851494ejb.206.1622471551033; 
 Mon, 31 May 2021 07:32:31 -0700 (PDT)
Received: from rocinante.localdomain ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id a22sm276031ejv.67.2021.05.31.07.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 07:32:30 -0700 (PDT)
Date: Mon, 31 May 2021 16:32:29 +0200
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Wesley Sheng <wesley.sheng@amd.com>
Subject: Re: [PATCH] Documentation PCI: Fix typo in pci-error-recovery.rst
Message-ID: <20210531143229.GA157228@rocinante.localdomain>
References: <20210531081215.43507-1-wesley.sheng@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210531081215.43507-1-wesley.sheng@amd.com>
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
Cc: wesleyshenggit@sina.com, corbet@lwn.net, linux-pci@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, oohall@gmail.com,
 bhelgaas@google.com, linasvepstas@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Wesley,

> Replace "It" with "If", since it is a conditional statement.
> 
[...]

Nice catch!

> -cycle) and then call slot_reset() again.  It the device still can't
> +cycle) and then call slot_reset() again.  If the device still can't
[...]

Thank you!

Reviewed-by: Krzysztof Wilczyński <kw@linux.com>

	Krzysztof
