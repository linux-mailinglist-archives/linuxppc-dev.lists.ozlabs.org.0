Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1F86AA930
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Mar 2023 11:35:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PTLp31Pzrz3f3q
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Mar 2023 21:35:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=traphandler.com (client-ip=46.105.34.251; helo=smtpout1.mo528.mail-out.ovh.net; envelope-from=jjhiblot@traphandler.com; receiver=<UNKNOWN>)
Received: from smtpout1.mo528.mail-out.ovh.net (smtpout1.mo528.mail-out.ovh.net [46.105.34.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PTLnT1RK0z3bXP
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Mar 2023 21:34:48 +1100 (AEDT)
Received: from pro2.mail.ovh.net (unknown [10.108.20.84])
	by mo528.mail-out.ovh.net (Postfix) with ESMTPS id BF00C20CD4;
	Sat,  4 Mar 2023 10:34:40 +0000 (UTC)
Received: from [192.168.1.41] (88.161.25.233) by DAG1EX1.emp2.local
 (172.16.2.1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Sat, 4 Mar
 2023 11:34:39 +0100
Message-ID: <7fa7f07f-d1e1-1e43-992c-4981c5810284@traphandler.com>
Date: Sat, 4 Mar 2023 11:34:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] of: irq: make callers of of_irq_parse_one() release
 the device node
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230301185209.274134-1-jjhiblot@traphandler.com>
 <20230301185209.274134-3-jjhiblot@traphandler.com>
 <CAMuHMdVF337k+zyjpbzoDtWWDnYhM6eM3+As6UuZ7FCgASsMQg@mail.gmail.com>
From: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
In-Reply-To: <CAMuHMdVF337k+zyjpbzoDtWWDnYhM6eM3+As6UuZ7FCgASsMQg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [88.161.25.233]
X-ClientProxiedBy: CAS2.emp2.local (172.16.1.2) To DAG1EX1.emp2.local
 (172.16.2.1)
X-Ovh-Tracer-Id: 2216615445481994549
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtuddgudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomheplfgvrghnqdflrggtqhhuvghsucfjihgslhhothcuoehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomheqnecuggftrfgrthhtvghrnhepvdefkedugeekueeuvdeuueevjefftddvtefhleekhfefffdtteetffeigfdvtdeinecukfhppeduvdejrddtrddtrddupdekkedrudeiuddrvdehrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhjhhhisghlohhtsehtrhgrphhhrghnughlvghrrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdpsghhvghlghgrrghssehgohhoghhlvgdrtghomhdpnhhmsehtihdrtghomhdpshhsrghnthhoshhhsehkvghrnhgvlhdrohhrghdpmhgrthhhihgrshdrnhihmhgrnhesihhnthgvlhdrtghomhdpghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhthhhivghrrhihrdhrvgguihhnghesghhmrghilhdrtghomhdpjhhonhgrthhhrg
 hnhhesnhhvihguihgrrdgtohhmpdhlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhlihhnuhigqdifihhrvghlvghsshesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugidqrggtthhiohhnsheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdplhhinhhugidqshhunhigiheslhhishhtshdrlhhinhhugidruggvvhdpuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhlihhnuhigqdhptghisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhfrhhofigrnhgurdhlihhsthesghhmrghilhdrtghomhdplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhhosghhodgutheskhgvrhhnvghlrdhorhhgpdhjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdpshgrrhgrvhgrnhgrkhesghhoohhglhgvrdgtohhmpdgtlhgvmhgvnhhtrdhlvghgvghrsegsohhothhlihhnrdgtohhmpdhmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtohhmpdhlihhnuhigsegrrhhmlhhinhhugid
 rohhrghdruhhkpdhmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdpnhhpihhgghhinhesghhmrghilhdrtghomhdptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdpiigrjhgvtgehsehgmhgrihhlrdgtohhmpdgurghnihgvlhdrlhgviigtrghnoheslhhinhgrrhhordhorhhgpdhtghhlgieslhhinhhuthhrohhnihigrdguvgdptghlrghuughiuhdrsggviihnvggrsehmihgtrhhotghhihhprdgtohhmpdhmrgiisehkvghrnhgvlhdrohhrghdprghfrggvrhgsvghrsehsuhhsvgdruggvpdhmrghniheskhgvrhhnvghlrdhorhhgpdhprghlmhgvrhesuggrsggsvghlthdrtghomhdpphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdifvghnshestghsihgvrdhorhhgpdhsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhlihhnuhigqdhtvghgrhgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehvdekpdhmohguvgepshhmthhpohhuth
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
Cc: Nishanth Menon <nm@ti.com>, zajec5@gmail.com, linux-pci@vger.kernel.org, ssantosh@kernel.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, saravanak@google.com, Samuel Holland <samuel@sholland.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, jonathanh@nvidia.com, Chen-Yu Tsai <wens@csie.org>, clement.leger@bootlin.com, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, mathias.nyman@intel.com, Manivannan Sadhasivam <mani@kernel.org>, linux-actions@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Claudiu 
 Beznea <claudiu.beznea@microchip.com>, linux-renesas-soc@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org, afaerber@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 02/03/2023 08:49, Geert Uytterhoeven wrote:
> Hi Jean-Jacques,
> 
> Thanks for your patch!
> 
> On Wed, Mar 1, 2023 at 7:53 PM Jean-Jacques Hiblot
> <jjhiblot@traphandler.com> wrote:
>> of_irq_parse_one() does a get() on the device node returned in out_irq->np.
>> Callers of of_irq_parse_one() must do a put() when they are done with it.
> 
> What does "be done with it" really mean here?
> 
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
> 
>> --- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
>> +++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
>> @@ -184,6 +184,7 @@ static int __init rcar_gen2_regulator_quirk(void)
>>                          kfree(quirk);
>>                          continue;
>>                  }
>> +               of_node_put(argsa->np);
> 
> The quirk object, which is a container of argsa, is still used below,
> and stored in a linked list.  I agree argsa->np is not dereferenced,
> but the pointer itself is still compared to other pointers.
Hi Geert,

I fail to see when the pointers are compared. It looks to me that only 
the args are compared. Am I missing something ?
In any case, looking more closely at the code, I guess that indeed the
of_node_put() shouldn't be added here because this code expects that the
nodes never go away. That is probably a good assertion in case of PMICs

JJ
> IIUIC, calling of_node_put() might cause the reference count to drop to
> zero, and the underlying struct node object to be deallocated.
> So when a future reference to the same DT node will be taken, a new
> struct node object will be allocated, and the pointer comparison below
> will fail?
> 
> Or am I missing something?
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
