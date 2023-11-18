Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AA47F032A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 23:50:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXprT6ZVWz3dVy
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Nov 2023 09:50:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.180; helo=mail-pf1-f180.google.com; envelope-from=bart.vanassche@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXf953VJKz2yLr
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Nov 2023 03:19:04 +1100 (AEDT)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6b77ab73c6fso2206015b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 08:19:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700324341; x=1700929141;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JpJ9j3Rgf+MmL1x+LnpZ5rIj3NB2ZwiexLJ0+/VPyNs=;
        b=d7ElO+cyW04LArxDV9ie9VHppvg0GD1agsTpJpArs50O8K2g5rOHouET0sxRzBS7/4
         rNnWO8gev8oA5+EzweN6xkdnQw9AKI4Ht33350hkhc8K0A1rCdz9gXUlW5USQuaJVzPj
         SCdMVQL4df+3d3+VZmqyRIdFVa5trZwA71Vx7/M41LxpK6gB9CjKJ85KQd2WlVefT4By
         uO9qv/1Cssg+6pzLqHBwgy1NYn3Kkgc/+7Yb3WJLyZ/Bzu9+5DFJ8t00hQy/WQQaWxk+
         FYBzlcpKD7hWz/htbryUEmAyJdmh1EGjcSAyozldmy50rHyhpX+jkjCTfWLPc3WwaF8N
         Oolw==
X-Gm-Message-State: AOJu0Yx91R5PvOj00B3YV0i5dip6fj6TIvxRp1Uu7+i+9ssldgLVoaFk
	3Ucid06Rvs3xn+ibbvfbSB8=
X-Google-Smtp-Source: AGHT+IF6DbzE+IGBVmgkkIXDBMasM05P7fXL7OHqGPwzqI5VVbby0wYg1pwoRaacJDugZHa97idotg==
X-Received: by 2002:a05:6a20:4326:b0:187:e3a5:b35d with SMTP id h38-20020a056a20432600b00187e3a5b35dmr3138014pzk.13.1700324340672;
        Sat, 18 Nov 2023 08:19:00 -0800 (PST)
Received: from ?IPV6:2601:647:4d7e:54f3:667:4981:ffa1:7be1? ([2601:647:4d7e:54f3:667:4981:ffa1:7be1])
        by smtp.gmail.com with ESMTPSA id b9-20020a056a000a8900b006c7c6ae3755sm3179469pfl.80.2023.11.18.08.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Nov 2023 08:19:00 -0800 (PST)
Message-ID: <792fc3d8-6834-48f8-9737-f1531459d245@acm.org>
Date: Sat, 18 Nov 2023 08:18:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/34] biops: add atomig find_bit() operations
Content-Language: en-US
To: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Akinobu Mita <akinobu.mita@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Chaitanya Kulkarni <kch@nvidia.com>, Christian Brauner <brauner@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, David Disseldorp <ddiss@suse.de>,
 Edward Cree <ecree.xilinx@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>,
 Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,
 Jiri Pirko <jiri@resnulli.us>, Jiri Slaby <jirislaby@kernel.org>,
 Kalle Valo <kvalo@kernel.org>, Karsten Graul <kgraul@linux.ibm.com>,
 Karsten Keil <isdn@linux-pingi.de>, Kees Cook <keescook@chromium.org>,
 Leon Romanovsky <leon@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Martin Habets <habetsm.xilinx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>,
 Nicholas Piggin <npiggin@gmail.com>, Oliver Neukum <oneukum@suse.com>,
 Paolo Abeni <pabeni@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Ping-Ke Shih <pkshih@realtek.com>,
 Rich Felker <dalias@libc.org>, Rob Herring <robh@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>,
 Sean Christopherson <seanjc@google.com>,
 Shuai Xue <xueshuai@linux.alibaba.com>, Stanislaw Gruszka <stf_xl@wp.pl>,
 Steven Rostedt <rostedt@goodmis.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wenjia Zhang <wenjia@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 GR-QLogic-Storage-Upstream@marvell.com, alsa-devel@alsa-project.org,
 ath10k@lists.infradead.org, dmaengine@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-net-drivers@amd.com, linux-pci@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, mpi3mr-linuxdrv.pdl@broadcom.com,
 netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
References: <20231118155105.25678-1-yury.norov@gmail.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231118155105.25678-1-yury.norov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 19 Nov 2023 09:48:14 +1100
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
Cc: Jan Kara <jack@suse.cz>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Matthew Wilcox <willy@infradead.org>, Alexey Klimov <klimov.linux@gmail.com>, Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/18/23 07:50, Yury Norov wrote:
> Add helpers around test_and_{set,clear}_bit() that allow to search for
> clear or set bits and flip them atomically.

There is a typo in the subject: shouldn't "atomig" be changed
into "atomic"?

Thanks,

Bart.

