Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC9B78940
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 12:08:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xwNx2vsCzDqLt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 20:08:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.221.67; helo=mail-wr1-f67.google.com;
 envelope-from=yefremov.denis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xwM50TQmzDqCZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 20:06:24 +1000 (AEST)
Received: by mail-wr1-f67.google.com with SMTP id p17so61126123wrf.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 03:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+lJIZvSYaI3dYqcvOi7SpRuQ2vDd2GcTwOMwgzFwFeQ=;
 b=a/TILrjeamfAsdH8/adJoGCQTpT5HKnOlMnhh15i3z7pcIbXFzKMKQ7B2roF2Fk+xN
 JL0NE7LnZL5J72lbO9s7OLUz2JB4Y4msenD8i+XZhrPp5Ioqu1lsqPQBE3v8h5MTsKLO
 885kUU8n4hP51UCUjtD3Tg2es7mpba90TU38IMT/KZUVGj5u2WEbIWpfLJgaz4X8cMO1
 TxV8WaJmS1qByNlgc7mdfFgwBczj0IQzN9ozDUjlKJGptVipP9B1ynUllZek184GOeLe
 CDpQcgX3mh0xcbBHQkKOhYmvqyWL7eXZFDkwCP+SjdACPyRgnChvReZ6+7XFnOf6TguM
 CToA==
X-Gm-Message-State: APjAAAUP9aGqAHWVZylA6ldlkKynKzFUzWuiISeLxdcHdSTKwAI4RGto
 Zny/xqtyOV2uO5v4f43Qbwc=
X-Google-Smtp-Source: APXvYqwRktv2fozVreuUhBqi1B5R21SS7JUFpkXMpWHHKx1itYi/JgJWJHXGc58FiILOo4GtbsPbvA==
X-Received: by 2002:a5d:4e45:: with SMTP id r5mr10938244wrt.206.1564394781631; 
 Mon, 29 Jul 2019 03:06:21 -0700 (PDT)
Received: from [10.68.32.192] (broadband-188-32-48-208.ip.moscow.rt.ru.
 [188.32.48.208])
 by smtp.gmail.com with ESMTPSA id x18sm54245837wmi.12.2019.07.29.03.06.20
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 03:06:21 -0700 (PDT)
Subject: Re: [EXTERNAL][PATCH 1/5] PCI: Convert pci_resource_to_user to a weak
 function
To: Paul Burton <paul.burton@mips.com>
References: <20190728202213.15550-1-efremov@linux.com>
 <20190728202213.15550-2-efremov@linux.com>
 <20190728224953.kezztdozc6k24ya3@pburton-laptop>
From: Denis Efremov <efremov@linux.com>
Message-ID: <cd83d298-45f6-7330-0347-96025cde8959@linux.com>
Date: Mon, 29 Jul 2019 13:06:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190728224953.kezztdozc6k24ya3@pburton-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Michal Simek <monstr@monstr.eu>, James Hogan <jhogan@kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Paul,

On 29.07.2019 01:49, Paul Burton wrote:
> Hi Denis,
> 
> This is wrong - using __weak on the declaration in a header will cause
> the weak attribute to be applied to all implementations too (presuming
> the C files containing the implementations include the header). You then
> get whichever impleentation the linker chooses, which isn't necessarily
> the one you wanted.

Thank you for pointing me on that. I will prepare the v2.
